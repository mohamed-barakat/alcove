#############################################################################
##
##  Matroid.gd                  alcove package                  Martin Leuner
##
##  Copyright 2012 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  Matroid declarations for alcove.
##
#############################################################################

DeclareCategory( "IsMatroid",
		IsObject );

DeclareCategory( "IsMinor",
		IsMatroid );


####################################
##
## Attributes
##
####################################

DeclareAttribute( "DualMatroid",
		IsMatroid );

DeclareAttribute( "ParentAttr",
		IsMinor );

DeclareAttribute( "SimpleMatroid",
		IsMatroid );

DeclareAttribute( "SizeOfGroundSet",
		IsMatroid );

DeclareAttribute( "RankOfMatroid",
		IsMatroid );

DeclareAttribute( "RankFunction",
		IsMatroid );

DeclareAttribute( "Bases",
		IsMatroid );

DeclareAttribute( "Circuits",
		IsMatroid );

DeclareAttribute( "TuttePolynomial",
		IsMatroid );

DeclareAttribute( "RankGeneratingPolynomial",
		IsMatroid );


####################################
##
## Properties
##
####################################

DeclareProperty( "IsUniform",
		IsMatroid );

DeclareProperty( "IsSimpleMatroid",
		IsMatroid );

DeclareProperty( "IsGraphic",
		IsMatroid );

DeclareProperty( "IsRegular",
		IsMatroid );


####################################
##
## Methods
##
####################################

DeclareOperation( "GroundSet",
		[ IsMatroid ] );

DeclareOperation( "MatrixOfVectorMatroid",
		[ IsMatroid ] );

####################################
##
## Constructors
##
####################################

DeclareOperation( "Matroid",
		[ IsMatroid ] );

DeclareOperation( "Matroid",
		[ IsInt, IsList ] );

DeclareOperation( "Matroid",
		[ IsList, IsList ] );

DeclareOperation( "Matroid",
		[ IsMatrix ] );

DeclareOperation( "Matroid",
		[ IsMatrixObj ] );

DeclareOperation( "Matroid",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidByCircuits",
		[ IsList, IsList ] );

DeclareOperation( "MatroidByRankFunction",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidOfGraph",
		[ IsMatrix ] );
