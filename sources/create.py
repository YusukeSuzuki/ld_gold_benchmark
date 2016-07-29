from jinja2 import Template

def create_functions(nums):
    template = Template( open('function.template').read() )

    for i in nums:
        out = template.render(i=i)
        open('{0:05d}.function.cpp'.format(i), 'w').write(out)

def create_main(nums):
    template = Template( open('main.template').read() )
    out = template.render(nums=nums)
    open('main.cpp', 'w').write(out)

nums = range(2000)
create_functions(nums)
create_main(nums)

