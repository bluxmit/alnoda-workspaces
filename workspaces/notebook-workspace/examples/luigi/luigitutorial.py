# https://gist.github.com/tomsing1/4c433655b3ac1aedb372ddfb1c7954db
# python luigitutorial.py --local-scheduler HelloWorld

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