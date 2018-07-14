import numpy as np
import matplotlib.pyplot as plt


def sampling(mu, sigma, sample_count): # function for sampling
    samples = np.zeros((2, sample_count)) # init samples
    samples[:, 0] = [3, -3] # generate a initial value (x0,y0)
    for t in range(1, sample_count):
        samples[:, t] = samples[:, t - 1]
        d = t % 2 # switch ZuoBiaoZhou
        # sample from p(x|y) or p(y|x)
        samples[d, t] = pxy_condition(d, mu, sigma, samples[:, t - 1])
    return samples


# function to get p(x|y) or p(y|x)
# index=0 means p(x|y),index=1 means p(y|x)
# value means (x,y)
def pxy_condition(index, mu, sigma, value):
    # calculate mu of p(x|y)
    mu_cond = mu[index] + sigma[index, ~index]*(value[~index] - mu[~index])/sigma[~index, ~index]
    # calculate sigma of p(x|y)
    sigma_cond = sigma[index, index] - sigma[index, ~index]*sigma[~index, index]/sigma[~index, ~index]
    return np.random.normal(mu_cond, sigma_cond) # return a rand value by mu and sigma


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
