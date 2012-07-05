# Sinatra: Up and Running Hands On (in Slim)
# branched from Richard Primus https://github.com/rprimus/sinatra-up-and-running-in-slim

Quote:

    Here is the incomplete (not using git module) of the hand's on  blog
    project from the final chapter in
    [Sinatra](http://www.amazon.co.uk/Sinatra-Up-Running-Alan-Harris/dp/1449304230/ref=sr_1_1?ie=UTF8&qid=1333952881&sr=8-1)

    I've chosen to implement this using [slim](http://slim-lang.org) as slim is
    the template system I intend to use going forward.

    The trickiest part to convert was the index page as
    * blocks cannot be used and
    * '-' **not** '==' should be used for any statement containing 'do'

    ## Helper script

    A helper script _launch.rb_ has been created to start the blog:

        ruby launch.rb

    to get started.
