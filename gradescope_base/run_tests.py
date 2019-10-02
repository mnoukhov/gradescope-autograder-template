import argparse
import io
import sys
import unittest

from gradescope_utils.autograder_utils.json_test_runner import JSONTestRunner


if __name__ == '__main__':
    original_stdout = sys.stdout
    sys.stdout = io.StringIO()
    suite = unittest.defaultTestLoader.discover('.')
    sys.stdout = original_stdout
    JSONTestRunner(visibility='visible').run(suite)
