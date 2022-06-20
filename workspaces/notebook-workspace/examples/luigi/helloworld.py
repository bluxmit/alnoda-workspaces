# to run, execute in terminal
#   python helloworld.py --local-scheduler HelloWorl

import luigi

class HelloWorld(luigi.Task):
    # no upstream requirements at all
    def requires(self):
        return None
    # creates a local file as output
    def output(self):
        return luigi.LocalTarget('helloworld.txt')
    # the actual job to perform
    def run(self):
        with self.output().open('w') as outfile:
            outfile.write('Hello World!\n')

if __name__ == '__main__':
    luigi.run()