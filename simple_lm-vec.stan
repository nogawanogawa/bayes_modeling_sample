data{
  int N;
  vector[N] speed;
  vector[N] dist;
  
  int N_pred;
  vector[N_pred] speed_pred;
}
parameters {
  real Intercept;
  real beta;
  real<lower=0> sigma;
}
model{
  for (i in 1:N) {
    dist[i] ~ normal(Intercept + beta*speed[i], sigma);
  }
}
generated quantities{
    vector[N_pred] mu_pred;
    vector[N_pred] dist_pred;
    
  for (i in 1:N_pred) {
    mu_pred[i] = Intercept + beta*speed_pred[i];
    dist_pred[i] = normal_rng(mu_pred[i],sigma);
  }    
}