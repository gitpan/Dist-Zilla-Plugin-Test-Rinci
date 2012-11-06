package Dist::Zilla::Plugin::Test::Rinci;

use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::PrereqSource';

use namespace::autoclean;

our $VERSION = '0.01'; # VERSION

# Register the release test prereq as a "develop requires"
# so it will be listed in "dzil listdeps --author"
sub register_prereqs {
  my ($self) = @_;

  $self->zilla->register_prereqs(
    {
      type  => 'requires',
      phase => 'develop',
    },
    'Test::Rinci' => '0.01',
  );
}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: A release test for Rinci metadata




=pod

=head1 NAME

Dist::Zilla::Plugin::Test::Rinci - A release test for Rinci metadata

=head1 VERSION

version 0.01

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files:

  xt/release/rinci.t - a standard Rinci metadata test

This test uses L<Test::Rinci> to check your Rinci metadata.

=head1 ACKNOWLEDGEMENTS

Code based on L<Dist::Zilla::Plugin::PodCoverageTests> by RJBS.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__DATA__
___[ xt/release/rinci.t ]___
#!perl

use Test::More;

eval "use Test::Rinci 0.01";
plan skip_all => "Test::Rinci 0.01 required for testing Rinci metadata"
  if $@;

metadata_in_all_modules_ok();
