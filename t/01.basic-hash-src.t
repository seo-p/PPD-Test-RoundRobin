=pod

=encoding utf8

=head1 SUMMARY

Unit Test for PPD::Test::RoundRobin
since 2019-11-26 by H.Seo

=head1 USAGE

```
$ cd <above-your-lib>
$ prove -l <path-to-this-script>
```

=cut

use strict;
use warnings;

use Test::More;
use Test::Exception;

# use Data::Dumper;
# $Data::Dumper::Terse	= 1;
# $Data::Dumper::Sortkeys	= 1;
# $Data::Dumper::Indent	= 2;

{
	BEGIN
	{
		BAIL_OUT("use PPD::Test::RoundRobin faild.") unless use_ok('PPD::Test::RoundRobin','all_combinations');
	}
	
	my $src =
	{
		"--hoge" =>
		[
			1,3,5,7,9
		]
		,"--moge" =>
		[
			qw/x y z/
		]
	};

	my $expected =
	[
		{'--hoge'	=> 1, '--moge'	=> 'x'},
		{'--hoge'	=> 3, '--moge'	=> 'x'},
		{'--hoge'	=> 5, '--moge'	=> 'x'},
		{'--hoge'	=> 7, '--moge'	=> 'x'},
		{'--hoge'	=> 9, '--moge'	=> 'x'},
		{'--hoge'	=> 1, '--moge'	=> 'y'},
		{'--hoge'	=> 3, '--moge'	=> 'y'},
		{'--hoge'	=> 5, '--moge'	=> 'y'},
		{'--hoge'	=> 7, '--moge'	=> 'y'},
		{'--hoge'	=> 9, '--moge'	=> 'y'},
		{'--hoge'	=> 1, '--moge'	=> 'z'},
		{'--hoge'	=> 3, '--moge'	=> 'z'},
		{'--hoge'	=> 5, '--moge'	=> 'z'},
		{'--hoge'	=> 7, '--moge'	=> 'z'},
		{'--hoge'	=> 9, '--moge'	=> 'z'}
	];

	my $all_comb = all_combinations( $src );

	is_deeply( $all_comb
		,$expected
		,'all_combinations returns expected data.'
	)
	|| diag Dumper( {'$all_comb' => $all_comb ,'$expected' => $expected });

	done_testing();
}
