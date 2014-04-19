---
title: Drill Press Cabinet
layout: post
comments: true
summary: I needed a space for my beer fridge, so I designed and built a base for my drill press that incorporated the fridge. Cheers!
tags: [make,woodworking,project]
---

I needed a space for the beer fridge in my workshop. And my bench-top drill press needed a sturdier base than the one it was sitting at the time. So I designed and built this cabinet. It has a compartment for the fridge at the bottom with some ventilation holes in the back of the cabinet, a couple of drawers for drill bits and whatnot and an open shelf for various thingamajigs I happen to work with at the moment. The top sports a grid of the Festool standard 20mm holes spaced 96mm apart.

<iframe src="http://sketchup.google.com/3dwarehouse/mini?mid=6162ca3de08538e15291a9c43f2c670c&etyp=im&width=400&height=300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" width="400" height="300"></iframe>

## Tools and Materials

You'll need one and a half 4' x 8' sheets of 3/4" plywood for the cabinet and drawer sides and one sheet of 1/4" plywood for the drawer bottoms. You'll also need two pairs of 18" full extension drawer slides, two drawer pulls, one pair of fixed and one pair of swivel with brakes casters. Screws and bolts for mounting drawer slides and casters.

A table saw or a plunge saw (or even a circular saw), drill press or manual drill and screwdrivers and wrenches to taste. A router with the 20mm router bit if you decide to make the optional dog holes in the cabinet top.

## Drawers

Inside dimensions of the cabinet:

    cabinet width = 19.500in
    cabinet depth = 19.750in
    cabinet height = 9.500in

    number of drawers = 2                    # the vertical space is evenly divided between the drawers

Clearances, margins and reveals:

    material thickness = 23in/32             # 3/4 plywood
    bottoms material thickness = 0.25in      # 1/4 plywood
    saw blade kerf = 0.100in                 # not particularly important
    rabbet depth = 0.250in                   # should be fine for both the 1/2" and 3/4" plywood sides
    slot depth = 0.250in                     # slot for the drawer bottom

    wood movement = 0.0625in                 # used only to calculate the size of the drawer bottoms
    slide clearance = 0.500in + 0.030in      # drawer slide thickness + the requisite tolerance of 0.030"
    back clearance = 0.750in                 # clearance between the back of the cabinet and the back of the drawer
    bottom rabbet margin = 0.500in           # distance to the bottom of the slot from the bottom of the drawer side
    reveal = 0.250in                         # reveal between the drawers

### Parts

Drawer parts' dimensions:

    height = (cabinet height - (number of drawers + 1) * reveal) / number of drawers
        => 4.375in
    front = cabinet width - slide clearance * 2        # same applies to drawer back
        => 18.44in
    side = cabinet depth - back clearance - (material thickness - rabbet depth) * 2
        => 18.0625in
    bottom width = front - material thickness * 2 + slot depth * 2 - wood movement
        => 17.44in
    bottom length = side - wood movement
        => 18in

Some additional measurements:

    # the inside hight of the drawer
    drawer depth = height - bottoms material thickness - bottom rabbet margin
        => 3.625in

    # these guys usually come in 2" increments, so plan your drawer size accordingly
    slide length = floor((side + (material thickness - rabbet depth) * 2) / 2) * 2
        => 18in

    # estimate for the amount of plywood required to build the drawers
    plywood length = front * 2 + side * 2 + saw blade kerf * 5
        => 73.505in
    plywood width = height * number of drawers + saw blade kerf * (number of drawers + 1)
        => 9.05in
    bottoms plywood length = bottom length * number of drawers + saw blade kerf * (number of drawers + 1)
        => 36.3in
    bottoms plywood width = bottom width * number of drawers + saw blade kerf * (number of drawers + 1)
        => 35.18in
