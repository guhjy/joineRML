#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;

//' Updates of lambda0 (E-step and M-step)
//'
//' @keywords internal
// [[Rcpp::export]]
arma::mat lambdaUpdate(Rcpp::List b_, Rcpp::List imat_, Rcpp::List zt_,
                      Rcpp::List f_, Rcpp::List v_, Rcpp::List d_,
                      arma::mat gam, arma::vec gam_vec, int q, arma::vec nev,
                      Rcpp::List h_) {

  arma::vec haz = arma::zeros<arma::vec>(nev.n_elem);

  // loop over subjects
  for (int i=0; i<b_.size(); i++) {

    // extract matrices from lists for subject i
    arma::mat b  = Rcpp::as<arma::mat>(b_[i]);
    arma::mat I  = Rcpp::as<arma::mat>(imat_[i]);
    arma::mat zt = Rcpp::as<arma::mat>(zt_[i]);
    arma::vec f  = Rcpp::as<arma::vec>(f_[i]);
    arma::vec v  = Rcpp::as<arma::vec>(v_[i]);
    double d = Rcpp::as<double>(d_[i]);
    Rcpp::DataFrame h = Rcpp::as<Rcpp::DataFrame>(h_[i]);

    // subjects who are censored before the first failure time
    // do not contribute towards \lambda estimation
    int tj_ind = h["tj.ind"];
    if (tj_ind == 0) continue;

    arma::mat expW_new = exp((b * gam) * trans(I * zt));
    arma::mat EexpVstar = mean(expW_new.each_col() % f, 0) / d;
    if (q > 0) {
      EexpVstar *= arma::as_scalar(exp(v * gam_vec.subvec(0, q-1)));
    }
    haz.subvec(0, EexpVstar.n_cols-1) += EexpVstar.t();

  }
  return(nev / haz);
}
