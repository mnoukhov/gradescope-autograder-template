import unittest

from gradescope_utils.autograder_utils.decorators import weight, visibility

from solution import Basics


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
