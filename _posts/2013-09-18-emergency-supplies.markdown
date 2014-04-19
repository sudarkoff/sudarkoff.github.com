---
title: Emergency Supplies
layout: post
tags: [emergency,survival,preparedness]
---

**This document is a work in progress.**

This is a worksheet for calculating the amounts of emergency supplies for a family of a given size.

Change these variables to recalculate the numbers (I'm using the mind-bogglingly amazing [Calca](http://calca.io/) to edit this document):

    persons = 6    # 3 adults, 2 kid, 2 pets averages to ~6 persons
    days = 10      # minimum recommended by US government
    
## Water

If treated properly, water can reliably be stored for 5 (recommended) and in some cases even up to 10 years.

    water per person per day = 1gl # a recommended minimum for drinking, food prep and hygiene
    
    supply of water = persons * days * water per person per day
        => 60gl
    
    barrel volume = 55gl
    water barrels = supply of water / barrel volume
        => 1.0909
    
## Calories

    calories per person per day = 2,600cal # for a moderately active middle aged male

    supply of calories = persons * days * calories per person per day
        => 156,000cal

    clif builders bar = 270cal
    energy bars = ceil(supply of calories / clif builders bar) # just for scale
        => 578

**To be continued...**

## Gas

Gas to power the generator (calculation are for the [Champion Power Equipment 46539](http://amzn.com/B004HSP7EK) generator).

    tank capacity = 3.8gl
    burn per hour = 3.8gl / 12                     # if running at 50% load (~1500 Watt)
    hours per day = 8                              # running part of the day
    gas per day = burn per hour * hours per day
        => 2.5333gl
    
    supply of gas = days * gas per day
        => 25.3333gl
    jerry cans = supply of gas / 5gl
        => 5.0667
    
## Other

E.g.: propane for cooking.

**To be continued...**
