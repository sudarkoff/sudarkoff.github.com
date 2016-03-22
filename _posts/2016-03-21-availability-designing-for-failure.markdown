---
layout: post
title: "Availability: Designing for failure"
comments: true
summary: What does it mean to design for failure and why is it important? 
---

What does it mean to design for failure and why is it important? Let's leave the buzzwords alone for a moment and remind ourselves what is it that we're usually trying to accomplish in software development. Ultimately, would like to provide a continuous service to our customers. Whenever there is an outage, a bug or even a need we do not yet meet, we would like to be able to respond quickly. That's the essence of Continuous Delivery. How do we achieve that?

## Designing for failure

There are two metrics in Operations that are relevant to this discussion. Mean time between failures (MTBF) represents the average time between two consecutive failures of a repairable system. And mean time to repair (MTTR), which represents the average time required to repair a system. MTBF focuses on maximizing the uptime while MTTR focuses on minimizing the downtime. These metrics provide a different view of the system's availability and could be thought of as two sides of the same coin. 

However, it has been demonstrated repeatedly that trying to maximize MTBF is no longer sufficient. On one hand, it is too costly as it typically requires expensive redundant hardware and software resources. On the other hand, there's only so much you can do for MTBF in complex environments with large numbers of independent components (e.g.: microservices). Failure becomes inevitable by the simple fact of arithmetic. Given that the reliability of a typical server is 99.99% (four nines), for a park of 1000 machines, statistically it means that every day something is broken for a combined total of about 2 hours. And this is just the hardware.

The alternative to focusing on MTBF is to focus on MTTR (mean time to repair). Frequent releases (i.e., Continuous Delivery) and microservices are the main components of an MTTR-centric fault management strategy. Frequent releases quite literally minimize the mean time to repair through the low latency of change. And microservices, by decomposing applications into small loosely coupled components, reduce the internal complexity of the software, which in turn leads to faster diagnostic and repair of bugs. Microservices architecture also reduces the impact of bugs and outages of any one service. To demonstrate, imagine a monolithic behemoth with a monthly release cycle. If a bug is not discovered during the QA cycle and is released to production, it will impact all users for an average of 15 days. For a site serving 1,000,000 users, the average cost of that bug is 15,000,000 user-days. Now imagine a site that consists of 100 microservices - a bug in one of the services impacts 1% of the users on average. If releasing a patch takes an hour, the average cost of this bug is 10,000 user-hours, or approximately 400 user-days - a reduction of the cost of failure by a factor of nearly 40,000!

But here's the rub: for the above math to work microservices must be truly small and loosely coupled. If microservices have a lot of tightly coupled dependencies and any one of those dependencies goes down, 100% of our users are affected. We have to pay closer attention to the resiliency of the microservices to a database, network, and other outages. Our goal should be to never have to display a "service unavailable" error to the customers - services must be able to degrade their functionality gracefully.

To close, a fortune cookie-sized sound bite to keep in mind while you're working on product features: the most important feature of any service is its availability.
