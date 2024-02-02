#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;


print "Digite a URL do site que deseja acessar: ";
my $url = <STDIN>;
chomp $url;


unless ($url) {
    die "URL errada\n";
}

my $ua = LWP::UserAgent->new;


my $response = $ua->get($url);


if ($response->is_success) {

    open my $arquivo, '>', 'index.html' or die "Não foi possível abrir o arquivo 'index.html' para escrita: $!";

    print $arquivo $response->content;

    close $arquivo;

    print " HTML salvo em 'index.html' com sucesso.\n";
} else {

    die "Erro ao obter o conteúdo: ", $response->status_line;
}