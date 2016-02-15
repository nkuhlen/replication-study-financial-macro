@#define RBC=0
        
var  R ${R}$ (long_name='Effective Gross Interest Rate')
     P ${P}$ (long_name='Price level')
     c ${c}$ (long_name='Consumption')
     n ${n}$ (long_name='Labor')
     u ${u}$ (long_name='capital utilization')
     d ${d}$ (long_name='Dividend')
     mu ${\mu}$ (long_name='Lagrange Multiplier enforcement constraint')
     chi ${\chi}$ (long_name='Lagrange Multiplier demand constraint')
     byhat ${x}$ (long_name='debt repurchase')
     Q ${Q}$ (long_name='Tobin Q')
     invest ${i}$ (long_name='Investment')
     w_opt ${w^*}$ (long_name='Optimal Wage')
     W ${W}$ (long_name='Aggregate Wage Index')
     y ${y}$ (long_name='Output')
     V ${V}$ (long_name='Value of the Firm')
     T ${T}$ (long_name='Lump sum taxes')
     k ${k}$ (long_name='Capital')
     b ${b}$ (long_name='Bond')
     r ${r}$ (long_name='Gross Interest Rate')

     z ${z}$ (long_name='Technology')
     zeta ${\zeta}$ (long_name='Investment Technology')
     gamma ${\gamma}$ (long_name='Preference shock')
     eta ${\eta}$ (long_name='Price Markup shock')
     upsilon ${\upsilon}$ (long_name='Wage Markup shock')
     G ${G}$ (long_name='Government spending shock')
     var_sigma ${\varsigma}$ (long_name='Monetary policy shock')
     xi ${\xi}$ (long_name='Financial Conditions')   
         
     wopthat ${\hat w^*}$ (long_name='optimal wage log deviations')   
     What ${\hat W}$ (long_name='wage log deviations')   
     upsilonhat ${\hat \upsilon}$ (long_name='wage markup log deviations')   
     yhat ${\hat y}$ (long_name='Output log deviations')   
     chat  ${\hat c}$ (long_name='consumption log deviations')   
     ihat  ${\hat i}$ (long_name='investment log deviations')   
     nhat  ${\hat n}$ (long_name='hours log deviations')   
     dyhat  ${\hat {\frac{d}{y}}}$ (long_name='equity payout log deviations')   
     muhat  ${\hat \mu}$ (long_name='Langrange multiplier log deviations')   
     vyhat  ${\hat {\frac{V}{Y}}}$ (long_name='equity value log deviations')   
     
     y_obs ${\Delta Y}$ (long_name='Growth rate GDP')   
     c_obs ${\Delta C}$ (long_name='Growth rate Consumption')   
     invest_obs ${\Delta I}$ (long_name='Growth rate Investment')   
     pi_obs ${\pi }$ (long_name='Inflation')   
     r_obs ${r }$ (long_name='net federal funds rate')   
     n_obs ${\Delta n}$ (long_name='hours worked')   
     W_obs ${\Delta W}$ (long_name='Growth rate real wage')   
     debt_repurchase_obs  ${\frac{\frac{b_{t-1}}{1+r_{t-1}}-\frac{b_{t}}{1+r_{t}}}{y_t}}$ (long_name='Debt repurchases')   
     ;

varexo   
     eps_z ${\varepsilon_z}$ (long_name='Technology shock')
     eps_zeta ${\varepsilon_{\zeta}}$ (long_name='Investment shock')
     eps_gamma ${\varepsilon_{\gamma}}$ (long_name='Preference shock')
     eps_eta ${\varepsilon_{\eta}}$ (long_name='Price Markup shock')
     eps_upsilon ${\varepsilon_{\upsilon}}$ (long_name='Wage Markup shock')
     eps_G ${\varepsilon_{g}}$ (long_name='Government shock')
     eps_varsigma ${\varepsilon_{\varsigma}}$ (long_name='Monetary shock')
     eps_xi ${\varepsilon_{\xi}}$ (long_name='Financial Shock')
         ;

parameters betta ${\beta}$ (long_name='discount factor')
        tau ${\tau}$ (long_name='tax wedge')
        alppha ${\alpha}$ (long_name='disutility from work')
        theta ${\theta}$ (long_name='capital share')
        delta ${\delta}$ (long_name='depreciation')
        xi_bar ${\bar \xi}$ (long_name='enforcement constraint')
        BY_ratio ${(\bar b/(1+\bar r)/\bar Y}$ (long_name='Debt output ratio')
        G_bar ${\bar G}$ (long_name='Average government purchases')
        GY_ratio ${\frac{\bar G}{\bar Y}}$ (long_name='Average government spending share')
        siggma ${\sigma}$ (long_name='risk aversion')
        epsilon ${\varepsilon}$ (long_name='Frisch elasticity')
        h ${h}$ (long_name='habit parameter')
        omega ${\omega}$ (long_name='Calvo Wage adjustment')
        phi ${\phi}$ (long_name='Rotemberg price adjustment cost')
        varrho ${\varrho}$ (long_name='investment adjustment cost')
        psi ${\psi}$ (long_name='capital utilization cost')
        kappa ${\kappa}$ (long_name='equity cost')
        eta_bar ${\bar \eta}$ (long_name='average price markup ')
        upsilon_bar ${\bar \upsilon}$ (long_name='average wage markup ')
        rho_z ${\rho_{z}}$ (long_name='productivity shock persistence')
        rho_zeta ${\rho_{\zeta}}$ (long_name='investment shock persistence')
        rho_gamma ${\rho_{\gamma}}$ (long_name='intertemporal shock persistence')
        rho_eta ${\rho_{\eta}}$ (long_name='price markup shock persistence')
        rho_upsilon ${\rho_{\upsilon}}$ (long_name='wage markup shock persistence')
        rho_G ${\rho_{G}}$ (long_name='government shock persistence')
        rho_varsigma ${\rho_{\varsigma}}$ (long_name='interest policy shock persistence')
        rho_xi ${\rho_{\xi}}$ (long_name='financial shock persistence')
        rho_gz ${\rho_{gz}}$ (long_name='interaction production government ')
        rho_R ${\rho_{R}}$ (long_name='Taylor rule persistence')
        nu_1 ${\nu_{1}}$ (long_name='Taylor rule feedback')
        nu_2 ${\nu_{2}}$ (long_name='Taylor rule feedback')
        nu_3 ${\nu_{3}}$ (long_name='Taylor rule feedback')
        ;
     
        
betta=0.982;
tau=0.35;
alppha=16.736;
theta=0.36;
delta=0.025;
xi_bar=0.199; %set in steady state file
BY_ratio=3.36;
G_bar=0.179; %set in steady state file
GY_ratio=0.18;
siggma=1.09;
epsilon=1.761;
h=0.608;
omega=0.278;
phi=0.031;
varrho=0.021;
psi=0.815;
kappa=0.426;
eta_bar=1.137;
upsilon_bar=1.025;
rho_z =0.902;
rho_zeta =0.922;
rho_gamma = 0.794;
rho_eta =0.906;
rho_upsilon=0.627;
rho_G =0.955;
rho_varsigma =0.203;
rho_xi = 0.969;
rho_gz =0.509;
rho_R =0.745;
nu_1 = 2.410;
nu_2 = 0;
nu_3 = 0.121;


options_.TeX=1;

@#if RBC 
    h=0;
    omega=0.001;
    phi=0;
    eta_bar=1.01;
    upsilon_bar=1.01;
    G_bar=0.001;
    varrho=0;                   // Do not need to shut down all other shock
                                // variances, because in a linearized model, we
                                // can look at impulse responses independently.
@#endif

model;
#Phi = (epsilon*(upsilon_bar-1)*(1-betta*omega))/(epsilon*(upsilon_bar-1)+upsilon_bar); %p.261
%Investment Adjustment Costs
#Upsilon                = zeta*(1-varrho*(invest/invest(-1)-1)^2)*invest; %p.263
#Upsilon_i              = zeta*(-2*varrho*(invest/invest(-1)-1)*(1/invest(-1)))*invest+zeta*(1-varrho*(invest/invest(-1)-1)^2);
#Upsilon_iminus1_at_tp1 = zeta(+1)*(-2*varrho*(invest(+1)/invest-1)*(-invest(+1)/invest^2))*invest(+1);
#vartheta   =(1-xi_bar*steady_state(mu))/betta-(1-delta);
%Utilization costs
#Psi        =vartheta*(u^(1+psi    )-1)/(1+psi); %p.263
#Psi_tp1    =vartheta*(u(+1)^(1+psi)-1)/(1+psi);
#Psi_u      =vartheta*u^(psi);
%Dividend adjustment cost
#varphi       =d    +   kappa*(d     - steady_state(d))^2; %p. 263 bottom
#varphi_d_tp1 =1    + 2*kappa*(d(+1) - steady_state(d));
#varphi_d     =1    + 2*kappa*(d     - steady_state(d));
%production function
#F      =   y; 
#F_u    =  (1/eta)*theta*y/u;
#F_n    =(1/eta)*(1-theta)*y/n;
#F_k_tp1=    (1/eta(+1))*theta*y(+1)/k;
%Demand
#D_n=(1-theta)*(1-eta)/eta/n;
#D_u=theta*(1-eta)/eta/u;
#D_k_tp1=theta*(1-eta(+1))/eta(+1)/k;
#m_t_plus_1=betta*gamma(+1)*(c(+1)-h*c)^(-siggma)/(gamma*(c-h*c(-1))^(-siggma));
%Price adjustment cost
#G_cost                 = phi/2*(P/P(-1)-1)^2*y; %eq. (25)
#G_cost_p               = phi*(P/P(-1)-1)*y/P(-1);
#G_cost_pminus1_at_tp1  = phi*(P(+1)/P-1)*y(+1)*(-P(+1)/(P^2));


%1.) HH Euler equation for bonds
1=m_t_plus_1*(1+r)*P/P(+1);

%2.)Capital utilization
(1-mu*varphi_d)*F_u-Psi_u*k(-1)-chi*D_u*varphi_d=0;

%3.)Euler equation for capital
m_t_plus_1*((1-delta)*Q(+1)+(F_k_tp1-Psi_tp1)/varphi_d_tp1-mu(+1)*F_k_tp1-chi(+1)*D_k_tp1)+xi*mu-Q=0;

%4.) Price of capital
Q*Upsilon_i+m_t_plus_1*Q(+1)*Upsilon_iminus1_at_tp1-1/varphi_d=0;
        
%5.) Law of motion for capital
k=(1-delta)*k(-1) + Upsilon;

%6.) Wage FOC
-((h*siggma*Phi)/(1-h))*chat(-1)+((siggma*Phi)/(1-h))*chat+Phi*(log(P)-log(steady_state(P)))+Phi*upsilonhat
    +Phi/epsilon*(log(n)-log(steady_state(n)))+(upsilon_bar*Phi)/((upsilon_bar-1)*epsilon)*What
    +betta*omega*wopthat(+1)-wopthat=0;

%7.)Wage index
W=(omega*W(-1)^(1/(1-upsilon))+(1-omega)*w_opt^(1/(1-upsilon)))^(1-upsilon);

%8.) Labor Demand
(1-mu*varphi_d)*F_n-W/P-chi*varphi_d*D_n=0;

%9.) Bond demand
m_t_plus_1*R*(varphi_d/varphi_d_tp1)*P/P(+1)+xi*mu*varphi_d*R/(1+r)=1;

%10.) Nominal price setting FOC
P*(G_cost_p+m_t_plus_1*(varphi_d/varphi_d_tp1)*G_cost_pminus1_at_tp1)-chi*varphi_d=0;
        
%11.) Firm's value
V=d+m_t_plus_1*V(+1);

%12.) Enforcement constraint
xi*(k-b/(P*(1+r)))=F;

%13.) Firm's budget
P*(F-Psi*k(-1))+b/R-b(-1)-W*n-P*G_cost-P*varphi-P*invest=0;

%14.) HH budget constraint
W*n+P*d-b/(1+r)+b(-1)-P*c-T=0;

%15.) Government budget
P*G+b*(1/R-1/(1+r))-T=0;
        
%16.) Monetary policy
rho_R*(r(-1)-steady_state(r))+(1-rho_R)*nu_1*(P-P(-1))+((1-rho_R)*nu_2+nu_3)*(y-steady_state(y))-nu_3*(y(-1)-steady_state(y))+var_sigma-(r-steady_state(r))=0;
        
%17.)Definition output
y=exp(z)*(u*k(-1))^theta*n^(1-theta);

%18.) Debt repurchase
byhat=(b(-1)/((1+r(-1)))-b/(1+r))/(P*y);

       
r=(R-tau)/(1-tau)-1;
yhat=log(y)-log(steady_state(y));
chat=log(c)-log(steady_state(c));
ihat=log(invest)-log(steady_state(invest));
nhat=log(n)-log(steady_state(n));
muhat=log(mu)-log(steady_state(mu));
upsilonhat=(log(upsilon)-log(upsilon_bar));
wopthat=(log(w_opt)-log(steady_state(w_opt)));
What=(log(W)-log(steady_state(W)));
dyhat=d/y;
vyhat=log(V/(k(-1)-b(-1)))-log(steady_state(V)/(steady_state(k)-steady_state(b)));


z=rho_z*z(-1)+eps_z;
log(zeta/1)=rho_zeta*log(zeta(-1)/1)+eps_zeta;
log(gamma/1)=rho_gamma*log(gamma(-1)/1)+eps_gamma;
log(eta/eta_bar)=rho_eta*log(eta(-1)/eta_bar)+eps_eta;
log(upsilon/upsilon_bar) = rho_upsilon*log(upsilon(-1)/upsilon_bar)+eps_upsilon;
log(G/G_bar)=rho_G*log(G(-1)/G_bar)+rho_gz*(z-z(-1))+eps_G;
var_sigma =rho_varsigma*var_sigma(-1)+eps_varsigma;
log(xi/xi_bar)=rho_xi*log(xi(-1)/xi_bar)+eps_xi;


//observation equations
y_obs =log(y) - log(y(-1));
c_obs =log(c) - log(c(-1));
invest_obs =log(invest)- log(invest(-1));
pi_obs= log(P) - log(P(-1));
r_obs= r-steady_state(r);
n_obs = log(n) - log(n(-1));
W_obs= log(W/P) - log(W(-1)/P(-1));
debt_repurchase_obs=byhat;
end;

shocks;
var eps_z = 0.005^2;
var eps_zeta =0.006^2;
var eps_gamma =0.016^2;
var eps_eta = 0.019^2;
var eps_upsilon = 0.085^2;
var eps_G = 0.028^2;
var eps_varsigma = 0.002^2;
var eps_xi= 0.008^2;
end;

estimated_params;
siggma,             normal_pdf, 1.5,0.37;
epsilon,            normal_pdf, 2.0,0.75;
h,                  beta_pdf, 0.5,0.3;
omega,              beta_pdf, 0.5,0.3;
phi,                inv_gamma_pdf,0.1, 0.3;
varrho,             inv_gamma_pdf,0.1, 0.3;
psi,                beta_pdf, 0.5,0.15;
kappa,              inv_gamma_pdf,0.2, 0.1;
eta_bar, , , , beta_pdf, 1.2, 0.1, 1, 2;
upsilon_bar, , , , beta_pdf, 1.2, 0.1, 1, 2;
rho_z,              beta_pdf, 0.5,0.2;
rho_zeta,           beta_pdf, 0.5,0.2;
rho_gamma,          beta_pdf, 0.5,0.2;
rho_eta,            beta_pdf, 0.5,0.2;
rho_upsilon,        beta_pdf, 0.5,0.2;
rho_G,              beta_pdf, 0.5,0.2;
rho_varsigma,       beta_pdf, 0.5,0.2;
rho_xi,             beta_pdf, 0.5,0.2;
rho_gz,              beta_pdf, 0.5,0.2;
rho_R,              beta_pdf, 0.75,0.1;
nu_1,               normal_pdf, 1.5,0.25;
nu_2,               normal_pdf, 0.12,0.05;
nu_3,               normal_pdf, 0.12,0.05;

stderr  eps_z,          inv_gamma_pdf, 0.001,0.05;
stderr  eps_zeta,       inv_gamma_pdf, 0.001,0.05;
stderr  eps_gamma,      inv_gamma_pdf, 0.001,0.05;
stderr  eps_eta,        inv_gamma_pdf, 0.001,0.05;
stderr  eps_upsilon,    inv_gamma_pdf, 0.001,0.05;
stderr  eps_G,          inv_gamma_pdf, 0.001,0.05;
stderr  eps_varsigma,  inv_gamma_pdf, 0.001,0.05;
stderr  eps_xi,         inv_gamma_pdf, 0.001,0.05;
end;

estimated_params_init(use_calibration);
end;

varobs
y_obs c_obs invest_obs pi_obs r_obs n_obs W_obs debt_repurchase_obs
;

estimation(nodisplay,
           nograph,
           mh_jscale=0.3,
           datafile=estimation_data,
           mh_nblocks=1,
           mode_compute=4,
           mode_check,
           diffuse_filter,
           mh_replic=20000,
           mh_conf_sig=0.95,
           bayesian_irf)y_obs c_obs invest_obs pi_obs r_obs n_obs W_obs debt_repurchase_obs;
