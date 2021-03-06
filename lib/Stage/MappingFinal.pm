#!/usr/bin/env perl

package Stage::MappingFinal;
use Stage;
@ISA = qw(Stage);

use File::Copy;
use File::Basename;

use strict;
use warnings;

sub new
{
        my ($proto, $job_properties, $logger) = @_;
        my $class = ref($proto) || $proto;
        my $self = $class->SUPER::new($job_properties, $logger);

        bless($self,$class);

	$self->{'_stage_name'} = 'mapping-final';

        return $self;
}

sub execute
{
        my ($self) = @_;

	my $logger = $self->{'_logger'};

	my $job_properties = $self->{'_job_properties'};
	my $pseudoalign_dir = $job_properties->get_dir('pseudoalign_dir');
	my $phylogeny_dir = $job_properties->get_dir('phylogeny_dir');

	$logger->log("\n================\n",0);
	$logger->log(  "= Output Files =",0);
	$logger->log("\n================\n",0);
	$logger->log("tree: $phylogeny_dir/pseudoalign.phy_phyml_tree.txt\n",0);
	$logger->log("matrix: $pseudoalign_dir/matrix.csv\n",0);
	$logger->log("pseudoalignment: $pseudoalign_dir/pseudoalign.phy\n",0);
}

1;
