data {
  int<lower=1> N; 
  int<lower=1> K;
  array[N] int<lower=1,upper=K> w; 
  array[N] int<lower=1,upper=K> b;
  array[N] int<lower=0,upper=2> s;
}
parameters {
  vector[K] R;
}
model {
  R ~ normal(2000, 200);
  s ~ binomial(2, 1/(1+10^((R[b]-R[w])/400)));
}
