use vars qw[$DEST_DIR];

package MY;

sub postamble {
  <<'__POSTAMBLE__';
faceplant_install ::
	mkdir -p $(FP_DEST_DIR); cp -r src/* $(FP_DEST_DIR)

__POSTAMBLE__
}

sub install {
    my $class = shift;
    my $basic = $class->SUPER::install(@_);
    my $add   = 'faceplant_install';
    $basic =~ s/^(install\s+::)\s+.*$/$1 $add/m;
    $basic;
}

sub constants {
    my $class = shift;
    my $basic = $class->SUPER::constants(@_);
    $basic = "FP_DEST_DIR = $main::DEST_DIR\n$basic";
    $basic;
}

package main;

use ExtUtils::MakeMaker;

$DEST_DIR = prompt(
q[What directory should faceplant be installed as?

For example, selecting `/usr/local/apache/htdocs/gallery' will cause the
dhandler to be installed as `/usr/local/apache/htdocs/gallery/dhandler'.

Directory:]
);

print <<__DIE_DIE_DIE__ and exit unless $DEST_DIR;
*** No Destination Directory Provided ***
__DIE_DIE_DIE__

WriteMakefile(
  NAME          => 'faceplant',
  ABSTRACT      => 'A Photo Gallery written in Mason and Imager',
  AUTHOR        => 'Casey West <casey@geeknest.com>',
  PREREQ_PM     => {
                     'HTML::Mason'           => 0,
                     'Imager'                => 0,
                     'HTML::Table'           => 0,
                     'List::Group'           => 0,
                     'File::Type'            => 0,
                     'File::Spec::Functions' => 0,
                   },
  VERSION_FROM  => 'src/dhandler',
);

