# Adapted from https://github.com/gtramontina/docker-diagrams

    cat my-diagram.py | docker run --rm -v "$(pwd):/out" -it vvilhonen/diagrams
