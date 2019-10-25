import unittest

from gradescope_utils.autograder_utils.decorators import weight, visibility

try:
    from solution import Basics
except Exception as e:
    raise Exception(f'Couldnt import your class Basics from "solution.py", remember to work off of the template. The error is {e}')


class TestBasics(unittest.TestCase):
    def setUp(self):
        self.basics = Basics()

    @weight(1)
    def test_add(self):
        a = 1
        b = 2
        out = self.basics.add(a,b)
        ans = a + b
        self.assertEqual(out, ans)

    @weight(1)
    def test_subtract(self):
        a = 1
        b = 2
        out = self.basics.subtract(a,b)
        ans = a - b
        self.assertEqual(out, ans)

    @weight(1)
    def test_multiply(self):
        a = 1
        b = 2
        out = self.basics.multiply(a,b)
        ans = a * b
        self.assertEqual(out, ans)

    @weight(1)
    def test_divide(self):
        a = 1
        b = 2
        out = self.basics.divide(a,b)
        ans = a / b
        self.assertEqual(out, ans)


if __name__ == '__main__':
    unittest.main()
