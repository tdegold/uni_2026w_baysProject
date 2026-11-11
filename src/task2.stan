data {
  int<lower=1> N; 
  int<lower=1> K;
  vector[N] t;
  array[N] int<lower=1,upper=K> w; 
  array[N] int<lower=1,upper=K> b;
  array[N] int<lower=0,upper=2> s;
}
parameters {
  vector[K] alpha;
  vector[K] beta;
}
transformed parameters {
  vector[N] Rw = (alpha[w] .* beta[w]) .* t;
  vector[N] Rb = (alpha[b] .* beta[b]) .* t;
}
model {
  s ~ binomial(2, 1/(1+10^((Rb-Rw)/400)));
}
