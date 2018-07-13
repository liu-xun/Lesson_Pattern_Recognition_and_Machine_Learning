import numpy as np
import matplotlib.pyplot as plt


def sampling(mu, sigma, sample_count):
    samples = np.zeros((2, sample_count))
    samples[:, 0] = [3, -3]
    for t in range(1, sample_count):
        samples[:, t] = samples[:, t - 1]
        d = t % 2
        samples[d, t] = pxy_condition(d, mu, sigma, samples[:, t - 1])
    return samples


def pxy_condition(index, mu, sigma, value):
    mu_cond = mu[index] + sigma[index, ~index]*(value[~index] - mu[~index])/sigma[~index, ~index]
    sigma_cond = sigma[index, index] - sigma[index, ~index]*sigma[~index, index]/sigma[~index, ~index]
    return np.random.normal(mu_cond, sigma_cond)


if __name__ == '__main__':
    # set up the means
    a_mu = 0
    b_mu = 0
    a_sigma = 1
    b_sigma = 1
    a_b_cov = 0.5
    # generate joint_mu and joint_cov
    joint_cov = np.vstack(((a_sigma, a_b_cov), (a_b_cov, b_sigma)))
    joint_mu = np.vstack((a_mu, b_mu))
    # sampling times
    N = 10000
    # start sampling
    samples = sampling(joint_mu, joint_cov, N)
    # draw result
    plt.plot(samples[0], samples[1], 'r.', ms=1.0)
    plt.show()
