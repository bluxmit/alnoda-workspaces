# https://gist.github.com/tomsing1/4c433655b3ac1aedb372ddfb1c7954db
#   python luigitutorial-2.py NameSubstituter --name Alfred

import luigi

class HelloWorld(luigi.Task):
    def requires(self):
        return None
    def output(self):
        return luigi.LocalTarget('helloworld.txt')
    def run(self):
        with self.output().open('w') as outfile:
            outfile.write('Hello World!\n')

class NameSubstituter(luigi.Task):

	# store the contents of luigi.Parameter() in the variable 'name'
    name = luigi.Parameter()

    # define upstream task
    def requires(self):
        return HelloWorld()
    # define output file, whose name is constructed from the input file
    def output(self):
        return luigi.LocalTarget(self.input().path + '.name_' + self.name)
    # the task to execute: read input file and substitute 'World'
    def run(self):
        with self.input().open() as infile, self.output().open('w') as outfile:
            text = infile.read()
            text = text.replace('World', self.name)
            outfile.write(text)

if __name__ == '__main__':
    luigi.run()