"""
You can auto-discover and run all tests with this command:

    py.test

Documentation: https://docs.pytest.org/en/latest/
"""


from script import calc_result


def test_1():
    test_numbers = [1, 1, 1, 1]
    expected_result =1
    assert calc_result(test_numbers) == expected_result

def test2():
    test_numbers = [2, 3, 3, 4]
    expected_result = 3
    assert calc_result(test_numbers) == expected_result