---
title: Fitness Proportionate Disk Selection
date: 2013-05-01T12:00:00-0800
tags: [programming]
---
_This is a proposal I made for improving the disk selection algorithm of a distributed file storage system._

## Current Disk Selection Algorithm
The current algorithm randomly selects a disk among the top N percent and assigns it to a given equivalence class. This strategy is suboptimal for a couple of reasons:

1. Even when there's a great variability of fitness values among the top N percent of the disks, the most suitable disks will have the same probability of being selected as the least suitable disks, thus leading to unbalanced placement. Simply decreasing the value of N is not sufficient to resolve the problem, as it is always possible to have a situation when the fitness variability is great regardless of how small the N is.
2. When nearly all disks in the pool have similar fitness values, they all deserve equal chance, yet only the top N percent will be considered. It's tempting to assume that the next round of placements will favor a different set of disks. But the selection of the next eligible set is determined by the weights that each fitness parameter is assigned. And it is possible that the same group of disks will be used for placement for a while, thus, once again, leading to unbalanced placement. 

Undoubtedly, we would like to preserve some randomness in the selection algorithm to minimize the chances of overwhelming the same disks and nodes with placements and IO. But for reasons stated above, a fitness proportionate selection algorithm is more desirable.

## Proposed Algorithm
The proposed algorithm is based on a frequently used method of selecting individuals based on their fitness in genetic and evolutionary algorithms. Typically, a Roulette-wheel selection algorithms is used. Imagine a Roulette wheel in a casino, with a proportion of the wheel assigned to each individual based on their fitness value. Spinning the wheel will result in a particular individual being selected with the probability Pi equal to the fitness of the individual Fi divided by the sum of fitness values for the entire population Sum(Fj), j=1:N. The higher the fitness of the individual, the higher the probability of it being selected. The weaker individuals still have a chance of surviving the selection process, thus preserving a degree of randomness.

A typical Roulette-wheel algorithm implementation has the complexity between O(N) and O(log N) depending on the search strategy used. But in May 2011, Adam Lipowski and Dorota Lipowska proposed an algorithm (arXiv:1109.3627v2 [cs.NE]) that has the complexity of O(1) and is based on stochastic acceptance instead of searching. Below is a brief description of the algorithm:

1. Randomly select one of the disks with uniform probability (without considering its fitness).
2. With probability Fi/Fmax, where Fmax is the maximal fitness in the population, the selection is accepted. Otherwise, repeat from step 1.

Algorithm implementation in pseudocode:

	accepted = False
	while (not accepted)
	    random(r)                      // random number 0<r<1
	    k = int(r*n)                   // k = 0, 1, 2,..., n-1
	    random(r)
	    if (r < weight(k)/MAX) then    // MAX - maximum of weights
	        accepted = True
	    end if
	end while
