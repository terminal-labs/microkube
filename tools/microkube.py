import click

import cli_passthrough.passthrough as passthrough

@click.group()
def cli():
    pass

@cli.command()
def app():
    exit_status = passthrough.passthrough('vagrant up')

if __name__ == '__main__':
    app()
