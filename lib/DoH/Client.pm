package DoH::Client;
  use Moo;
  use HTTP::Tiny;
  use Net::DNS::Packet;

  has ua => (is => 'ro', default => sub { HTTP::Tiny->new });

  has server => (is => 'ro', required => 1);
  has resolve_endpoint => (is => 'ro', default => sub { '/dns-query' });

  sub resolve {
    my ($self, $name, $type) = @_;

    my $q = Net::DNS::Packet->new($name, $type);

    my $res = $self->ua->request(
      'POST',
      'https://' . $self->server . $self->resolve_endpoint, {
        headers => {
         'accept'        => 'application/dns-message',
         'content-type'  => 'application/dns-message',
         'user-agent'    => 'DoH::Client',
        },
        #content => encode_base64($q->encode),
        content => $q->encode,
      }
    );
    die "HTTP error: $res->{ status }: $res->{ content }" if (not $res->{ success });

    my $dns_response_bin = $res->{ content };
    my $dns_response = Net::DNS::Packet->new(\$dns_response_bin);

    return $dns_response;
  }

1;
