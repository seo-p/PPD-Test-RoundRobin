package PPD::Test::RoundRobin;

{
	our $VERSION = '0.001';
}

use strict;
use warnings;
use Carp;

use Exporter 'import';

our @EXPORT = qw();
our @EXPORT_OK = qw/
					all_combinations
				/;
our %EXPORT_TAGS = ();	# ex) (T1 => [qw(A1 A2 B1 B2)], T2 => [qw(A1 A2 B3 B4)]);

sub all_combinations
{
	my $hash_or_array = shift @_;

	my @size_list = ();
	my @index = ();
	my $src_is_array = undef;
	if( ref $hash_or_array eq ref {} )
	{
		@index = sort keys %$hash_or_array;
		map {push @size_list , scalar( @{$hash_or_array->{$_}}) } @index;
	}
	elsif( ref $hash_or_array eq ref [] )
	{
		@index = (0..(@$hash_or_array - 1));
		map {push @size_list , scalar( @{$hash_or_array->[$_]} ) } @index;
		$src_is_array = 1;
	}
	else
	{
		return undef;
	}

	my $rr = _round_robin_with_size_list( @size_list );

	my @results = ();
	if( $src_is_array )
	{
		for my $row ( @$rr )
		{
			my @items_in_row = ();
			for(my $i=0;$i<@index;$i++)
			{
				my $col_key		= $index[$i];
				my $item_idx	= $row->[$i];

				my $col_value;

				$col_value = $hash_or_array->[$col_key]->[$item_idx];
				push @items_in_row ,$col_value;
			}

			push @results ,\@items_in_row;
		}
	}
	else
	{
		my %results = ();

		for my $row ( @$rr )
		{
			my %params = ();
			for(my $i=0;$i<@index;$i++)
			{
				my $col_key		= $index[$i];
				my $item_idx	= $row->[$i];

				my $col_value = $hash_or_array->{$col_key}->[$item_idx];
				$params{$col_key} = $col_value;
			}


			push @results ,\%params;
		}
	}

	return \@results;
}

sub _round_robin_with_size_list
{
	my @size_list = @_;

	my $combination_pat = 1;
	grep { $combination_pat *= $_ } @size_list;

	my @all_combination = ();
	for(my $i=0 ; $i < $combination_pat ; $i++ )
	{
		my @digits = ();
		my $buf = $i;
		for my $size ( @size_list )
		{
			push @digits , $buf % $size;

			$buf = int($buf / $size);
		}

		push @all_combination , \@digits;
	}

	return \@all_combination;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

RoundRobin

=head1 What is RoundRobin

=head1 Author

- Create on : 2019/11/26
- Author : H.Seo

=cut
