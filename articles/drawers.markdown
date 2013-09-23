# Plywood Drawers

A worksheet for calculating dimensions for plywood drawers constructed with a simple rabbet joint.

![Simple plywood drawer](https://farm3.staticflickr.com/2827/9904065054_f1d6444417.jpg)

Inside dimensions of the cabinet:

    cabinet width = 20.000in
    cabinet depth = 19.750in
    cabinet height = 9.500in
    
    number of drawers = 2                    # the vertical space is evenly divided between the drawers

Clearances, margins and reveals:

    material thickness = 15in/32             # 1/2 plywood
    bottoms material thickness = 0.25in      # 1/4 plywood
    saw blade kerf = 0.100in                 # not particularly important
    rabbet depth = 0.250in                   # should be fine for both the 1/2" and 3/4" plywood sides
    slot depth = 0.250in                     # slot for the drawer bottom
    
    wood movement = 0.0625in                 # used only to calculate the size of the drawer bottoms
    slide clearance = 0.500in + 0.030in      # drawer slide thickness + the requisite tolerance of 0.030"
    back clearance = 0.750in                 # clearance between the back of the cabinet and the back of the drawer
    bottom margin = 0.500in                  # distance to the bottom of the slot from the bottom of the drawer side
    reveal = 0.250in                         # reveal between the drawers
        
## Parts

Drawer parts' dimensions:

    height = (cabinet height - (number of drawers + 1) * reveal) / number of drawers
        => 4.375in
    front = cabinet width - slide clearance * 2        # same applies to drawer back
        => 18.94in
    side = cabinet depth - back clearance - (material thickness - rabbet depth) * 2
        => 18.5625in
    bottom width = front - material thickness * 2 + slot depth * 2 - wood movement
        => 18.44in
    bottom height = side - wood movement
        => 18.5in

Some additional measurements:
    
    # the inside hight of the drawer
    drawer depth = height - bottoms material thickness - bottom margin
        => 3.625in

    # these guys usually come in 2" increments, so plan accordingly
    slide length = side + (material thickness - rabbet depth) * 2
        => 19in

    # estimate for the amount of plywood required to build the drawers
    plywood length = front * 2 + side * 2 + saw blade kerf * 5
        => 75.505in
    plywood width = height * number of drawers + saw blade kerf * (number of drawers + 1)
        => 9.05in
    bottoms plywood length = bottom height * number of drawers + saw blade kerf * (number of drawers + 1)
        => 37.3in
    bottoms plywood width = bottom width * number of drawers + saw blade kerf * (number of drawers + 1)
        => 37.18in
