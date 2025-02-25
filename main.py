# 3.
from circle import Circle
from square import Square


def equals_perimeters(shapes):
    scope = shapes[0].calc_perimeter()
    for i in range(1, len(shapes)):
        if shapes[i].calc_perimeter() != scope:
            return False
    return True


# 4.
def is_shape_exist(shapes, shape):
    if shape in shapes:
        return True
    return False


# 5.
def multi_shapes(shapes):
    return [shape+ shape for shape in shapes]


