=pod

=encoding utf8

=head1 SUMMARY

Unit Test for PPD::Test::RoundRobin
since 2019-11-26 by H.Seo

=head1 USAGE

case1:

```
$ cd <above-your-lib>
$ perl -Ilib <path-to-this-script>
```


=cut

use strict;
use warnings;

use Test::More;
use Test::Exception;

# use Scalar::Util qw/blessed/;

use Data::Dumper;
$Data::Dumper::Terse	= 1;
$Data::Dumper::Sortkeys	= 1;
$Data::Dumper::Indent	= 2;

{
	BEGIN
	{
		BAIL_OUT("use PPD::Test::RoundRobin faild.") unless use_ok('PPD::Test::RoundRobin','all_combinations');
	}
	
	my @src = (
					[qw/A B/],
					[10..13]
			);

	my $expected =
	[
		[ 'A' , 10 ],
		[ 'B' , 10 ],
		[ 'A' , 11 ],
		[ 'B' , 11 ],
		[ 'A' , 12 ],
		[ 'B' , 12 ],
		[ 'A' , 13 ],
		[ 'B' , 13 ]
	];

	my $result = all_combinations( \@src );

	is_deeply(
		$result,
		$expected,
		"all_combinations returns expected list."
	)
	|| diag( Dumper({'$result' => $result , '$expected' => $expected }) );

	done_testing();
}
