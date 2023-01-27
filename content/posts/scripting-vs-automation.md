---
title: Scripting versus automation
date: 2014-09-15T12:00:00-0800
---
_ This was originally shared with the engineering org of a company I worked for at the time. It's my stream of consciousness about the type of system my team was building at the time. Reproducing here without modifications, enjoy the chaos of my unedited remblings._

Team,

It became clear to me in the last few days that there's not enough clarity about what we're trying to build.

We keep talking about relatively small and specific things, but we never discuss the philosophy behind it all. What type of system are we building? Can't we just install Puppet and Terraform and call it done? And focus instead on something more glamorous than spinning VMs?

I think, to answer these questions, we first have to talk about the differences between a centralized and a distributed system, and between scripting and automation.

## Centralized vs. distributed
A brain is a useful metaphor for a centralized system. It receives information from a number of sources (eyes see a lion; ears hear the lion roar), analyses the information and responds with commands to various other systems (legs, run). We tend to consider centralized systems to be "smart"—they make decisions based on a complex set of inputs, often rapidly. But as the amount of information to be transmitted and processed goes up with scale, the time that it takes to produce a decision goes up exponentially and the system becomes slow. Another word for "slow" is "dumb".

The alternative to centralized is a distributed system. A distributed system could be thought of as a society of autonomous agents. Societies scale much better because the agents can interact loosely with each other. And if one of the connections becomes severed, no agents become cut off from the rest of the society—the information continues to flow, and the decisions are still being made.

Societies might include centralized components (e.g., a public library), but the society is capable of surviving the failure of the centralized components. The individual agents of a distributed system are often viewed as "dumb". The smarts emerge at the system level.

Another good example of a distributed system is our immune system. When we talk about the immune system as a whole, we talk about it "attacking" pathogens and "evolving" to develop immunity to new germs—all that sounds very "smart".

But at the cell level, the reality is quite different—it's basically a few billion cells floating around and bumping into other cells. If one immune cell happens to mate with another cell like a puzzle piece, it reacts in some way (chemically? I've no idea, to be honest) and thus "neutralize" another cell—as dumb as it gets!

## Dumb vs. smart
The "dumb" and "smart" monikers are very relative of course and depend on the scale at which we look at the system. What was fast and smart when we had 50 services won't be when we have 500.

And what we call a "dumb" agent could be pretty darn clever if you look at it individually. The import point here is that the agents are autonomous and that they make their own decisions based on the local information available to them. Nobody tells them what to do, they take an input and react.

## Scripting vs. automation
This brings us to scripting vs. automation.

We usually call them both "automation" in our industry, which, I think, is a big mistake because words matter and these two are quite different.

Scripting is a push, from a centralized system, command-and-control style of execution. Some "brain" (computer or human) receives information from various sources and runs a script against a herd of servers in response—it tells the servers what to do. The bigger the system, the slower and more error-prone this process is, it doesn't scale. 

Automation, on the other hand, is a process of building an autonomous system—a system that does not require any human intervention during normal operation. (But when things turn abnormal—monitoring becomes important!)

Distributed autonomous systems, as I said above, typically consist of relatively dumb autonomous agents (e.g., our very own _\<redacted\>_) that take an input and react. All the smarts emerge at the system level.

For example, you type `<redacted> create <redacted> -r snmp-collector` and boom!, in a few minutes we're collecting snmp metrics from our infra and sending them to Datadog.

## What are we building?
So, if we want to be as big as Facebook in 2–3 years, what type of system do we want to build? Do we want to have to constantly babysit thousands of servers in half a dozen datacenters, run scripts to provision and configure machines, patch and fix them manually… or do we want things to just happen on their own, automagically?

The answer is clearly—we want an autonomous system.

Now, how do we get there incrementally, without wasting too much effort on processes that do not scale and that will be very difficult to deprecate? That's the story for my next email—stay tuned.