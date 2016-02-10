var 
     c ${c}$ (long_name='Consumption')
     n ${n}$ (long_name='Labor')
     w ${w}$ (long_name='Wage')
     k ${k}$ (long_name='Capital')
     R ${R}$ (long_name='Effective Gross Interest Rate')
     r ${r}$ (long_name='Gross Interest Rate')
     d ${d}$ (long_name='Dividend')
     b ${b}$ (long_name='Bond')
     mu ${\mu}$ (long_name='Lagrange Multiplier')
     v ${v}$ (long_name='Value of the Firm')
     z ${z}$ (long_name='Technology')
     xi ${\xi}$ (long_name='Financial Conditions')
     y ${y}$ (long_name='Output')
     inv ${inv}$ (long_name='Investment')
         
     yhat chat ihat nhat byhat dyhat muhat vyhat
;

varexo   
     eps_z ${\varepsilon_z}$ (long_name='Technology shock')
     eps_xi ${\varepsilon_{\xi}}$ (long_name='Financial Shock')
;

parameters
     theta ${\theta}$ (long_name='capital share')
     betta ${\beta}$ (long_name='discount factor')
     alppha ${\alpha}$ (long_name='disutility from work')
     delta ${\delta}$ (long_name='depreciation')
     tau ${\tau}$ (long_name='tax wedge')
     kappa ${\kappa}$ (long_name='equity cost')
     siggma ${\sigma}$ (long_name='risk aversion')
     sigma_z ${\sigma_z}$ (long_name='std_z')
     sigma_xi ${\sigma_xi}$ (long_name='std_xi')
     BY_ratio ${(\bar b/(1+\bar r)/\bar Y}$ (long_name='Debt output ratio')
     A11 ${A_{11}}$ (long_name='A_11')
     A12 ${A_{12}}$ (long_name='A_12')
     A21 ${A_{21}}$ (long_name='A_21')
     A22 ${A_{22}}$ (long_name='A_22')
;
     
siggma=1;
theta = 0.36;
betta = 0.9825;
delta = 0.025;
tau = 0.35;        
BY_ratio=3.36;

kappa = 0.146;       
kappa_store=kappa;
sigma_xi = 0.0098;  
sigma_z = 0.0045; 
covariance_z_xi =0;
A11 = 0.9457;
A12 = -0.0091;
A21 = 0.0321;
A22 = 0.9703;


model;

    w/c^siggma-alppha/(1-n)=0;
    c^(-siggma)=betta*((R-tau)/(1-tau))*c(+1)^(-siggma);
    w*n+b(-1)-b/R+d-c=0;
    (1-theta)*z*k(-1)^theta*n^(-theta)=w*(1/(1-mu*(1+2*kappa*(d-steady_state(d)))));
    betta*(c/(c(+1)))^siggma*((1+2*kappa*(d-steady_state(d)))/(1+2*kappa*(d(+1)-steady_state(d))))*(1-delta+(1-mu(+1)*(1+2*kappa*(d(+1)-steady_state(d))))
        *theta*z(+1)*k^(theta-1)*n(+1)^(1-theta))+xi*mu*(1+2*kappa*(d-steady_state(d)))=1;
    R*betta*(c/(c(+1)))^siggma*((1+2*kappa*(d-steady_state(d)))/(1+2*kappa*(d(+1)-steady_state(d))))+xi*mu*(1+2*kappa*(d-steady_state(d)))*(R*(1-tau)/(R-tau))=1;
    (1-delta)*k(-1)+z*k(-1)^theta*n^(1-theta)-w*n-b(-1)+b/R-k-(d+kappa*(d-steady_state(d))^2)=0;
    xi*(k-b*((1-tau)/(R-tau)))=z*k(-1)^theta*n^(1-theta);

    log(z/steady_state(z))=A11*log(z(-1)/steady_state(z))+A12*log(xi(-1)/steady_state(xi))+eps_z;    %exogenous process for tech level
    log(xi/steady_state(xi))=A21*log(z(-1)/steady_state(z))+A22*log(xi(-1)/steady_state(xi))+eps_xi; %exogenous process for financial conditions

    y=z*k(-1)^theta*n^(1-theta);
    inv=k-(1-delta)*k(-1);
    v=d+betta*c/c(+1)*v(+1);                          % taken from equation 11) in appendix p.8
    r=(R-tau)/(1-tau)-1;
    
    % define log-deviations
    yhat=log(y)-log(steady_state(y));
    chat=log(c)-log(steady_state(c));
    ihat=log(inv)-log(steady_state(inv));
    nhat=log(n)-log(steady_state(n));
    muhat=log(mu)-log(steady_state(mu));
    byhat=(b(-1)/(1+r(-1))-b/(1+r))/y;            
    dyhat=d/y;
    vyhat=log(v/(k(-1)-b(-1)))-log(steady_state(v/(k(-1)-b(-1))));
end;

steady_state_model;
    xi=0.16338;
    z=1;
    n=0.3;
    R=(1-tau)/betta+tau;
    mu=(1-R*betta)/(xi*(R*(1-tau)/(R-tau)));
    k=((((1-xi*mu)/betta)-(1-delta))/((1-mu)*theta*z*n^(1-theta)))^(1/(theta-1));
    w=((1-theta)*k^theta*n^(-theta)*z)*(1-mu);
    b=(z*k^theta*n^(1-theta)/xi-k)*(tau-R)/(1-tau);
    d=(1-delta)*k+z*k^(theta)*n^(1-theta)-w*n-b+b/R-k;
    c=w*n+b-b/R+d;
    alppha=w/c^siggma*(1-n);

    y=z*k^theta*n^(1-theta);
    inv=delta*k;
    v=d/(1-betta);
    r=(R-tau)/(1-tau)-1;
    yhat=0;
    chat=0;
    ihat=0;
    nhat=0;
    muhat=0;
    byhat=0;
    dyhat=d/y;
    vyhat=0;
end;

shocks;
    var eps_xi=sigma_xi^2;
    var eps_z= sigma_z^2;       
    var eps_z,eps_xi = covariance_z_xi;
end;

steady;

check;
resid;

stoch_simul(order=1,irf=105,nograph) ;
