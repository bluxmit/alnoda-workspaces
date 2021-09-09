#!/usr/bin/env python3
"""
Example of tiny python script that calculates mean from the list of numbers

Select any line of python script and evaluate with Shift + Enter

Execute the whole script from terminal:
>> python app.py

Run tests with generation of HTML report:
>> pytest --html-report=/home/static-server/tests/basic-python-app
"""

from logzero import logger


numbers_1 = [1, 12, 53, 22, 41, 84]
numbers_2 = [31, 65, 84, 212, 4, 48, 54, 67, 20]


def calc_result(numbers):
    """ Calculate average of numbers """
    return sum(numbers) / len(numbers)


def write_to_file(file_name, numbers, result):
    """ Write computation results to file """
    with open(f"/home/examples/{file_name}.txt", "w") as file:
        file.write(f"NUMBERS: {str(numbers)}")
        file.write(f"\nAVERAGE: {str(result)}")


def main():
    """ Main entry point of the app """
    logger.info("start calculation")
    result_1 = calc_result(numbers_1)
    write_to_file("result_1", numbers_1, result_1)
    result_2 = calc_result(numbers_2)
    write_to_file("result_2", numbers_2, result_2)
    logger.info("finish calculation")


if __name__ == "__main__":
    """ This is executed when run from the command line """
    main()



