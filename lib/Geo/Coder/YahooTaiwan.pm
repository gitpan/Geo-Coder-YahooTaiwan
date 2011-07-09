package Geo::Coder::YahooTaiwan;

use JSON::XS;
use LWP::UserAgent;
use strict;
our $VERSION = '0.02';

sub new {
  my($class, %param) = @_;
  my $ua = delete $param{ua} || LWP::UserAgent->new(agent => __PACKAGE__ . "/$VERSION");
  bless { ua => $ua }, $class;
}

sub ua {
  my $self = shift;
  if (@_) {
    $self->{ua} = shift;
  }
  $self->{ua};
}

sub geocode {
  my $self = shift;

  my %param;
  if (@_ % 2 == 0) {
    %param = @_;
  } else {
    $param{location} = shift;
  }

  my $location = $param{location}
  or Carp::croak("Usage: geocode(location => \$location)");

  my $uri = URI->new("http://tw.api.maps.yahoo.com/maplocal");
  $uri->query_form(p => $location, t => 'addr');

  my $res = $self->{ua}->get($uri);

  if ($res->is_error) {
    Carp::croak("Yahoo! Taiwan Maps API returned error: " . $res->status_line);
  }

  my $content = $res->content;
  $content =~ s/}[^}]*$/}/;
  my $json = decode_json($content);
  return $json;
}

1;
__END__

=head1 NAME

Geo::Coder::YahooTaiwan - Yahoo! Taiwan Maps Geocoding API

=head1 SYNOPSIS

  use Geo::Coder::YahooTaiwan;
  my $geocoder = new Geo::Coder::YahooTaiwan;
  my $location = $geocoder->geocode(location => '台北市南港區三重路66號');

=head1 DESCRIPTION

Yahoo! Taiwan Maps Geocoding API

=head1 SEE ALSO

  JSON::XS
  LWP::UserAgent

=head1 AUTHOR

Yen-Ming Lee, E<lt>leeym@leeym.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Yen-Ming Lee

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
