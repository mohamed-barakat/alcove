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

DeclareCategory( "IsMinorOfMatroid",
		IsMatroid );

####################################
##
## Constructors
##
####################################

## Copy:

DeclareOperation( "Matroid",
		[ IsMatroid ] );

## Vector matroids:

DeclareOperation( "Matroid",
		[ IsGeneralizedRowVector and IsNearAdditiveElementWithInverse and IsAdditiveElement ] );

DeclareOperationWithDocumentation( "Matroid",
				[ IsHomalgMatrix ],
				[ "Returns the vector matroid corresponding to the homalg matrix <A>h</A> over some homalg field." ],
				"a vector matroid",
				"h",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "MatroidNL",
		[ IsHomalgMatrix ] );

## Abstract matroids:

DeclareOperationWithDocumentation( "MatroidByBases",
				[ IsList, IsList ],
				[ "Returns the abstract matroid having the list <A>gset</A> as ground set and the list <A>bases</A> as list of bases. ",
				"The method checks the base exchange axiom. To construct an abstract matroid with bases without any checks, ",
				"use the method MatroidByBasesNCL." ],
				"an abstract matroid with bases",
				"gset,bases",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "MatroidByBasesNCL",
		[ IsList, IsList ] );

DeclareOperationWithDocumentation( "MatroidByBases",
				[ IsInt, IsList ],
				[ "Returns the abstract matroid on <A>n</A> elements having the list <A>bases</A> as list of bases. ",
				"The method checks the base exchange axiom. To construct an abstract matroid with bases without any checks, ",
				"use the method MatroidByBasesNCL." ],
				"an abstract matroid with bases",
				"n,bases",
				[ "Matroids", "Construction" ]
			 );

DeclareOperation( "MatroidByBasesNCL",
		[ IsInt, IsList ] );

DeclareOperation( "MatroidByIndependenceFunction",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidByIndependenceFunctionNCL",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidByIndependenceFunction",
		[ IsInt, IsFunction ] );

DeclareOperation( "MatroidByIndependenceFunctionNCL",
		[ IsInt, IsFunction ] );

DeclareOperationWithDocumentation( "MatroidByCircuits",
				[ IsList, IsList ],
				[ "Returns the abstract matroid having the list <A>gset</A> as ground set and the list <A>circs</A> as list of circuits. ",
				"The method checks the circuit elimination axiom. To construct an abstract matroid with circuits without any checks, ",
				"use the method MatroidByCircuits." ],
				"an abstract matroid with circuits",
				"gset,circs",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "MatroidByCircuitsNCL",
		[ IsList, IsList ] );

DeclareOperationWithDocumentation( "MatroidByCircuits",
				[ IsInt, IsList ],
				[ "Returns the abstract matroid on <A>n</A> elements having the list <A>circs</A> as list of circuits. ",
				"The method checks the circuit elimination axiom. To construct an abstract matroid with circuits without any checks, ",
				"use the method MatroidByCircuits." ],
				"an abstract matroid with circuits",
				"n,circs",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "MatroidByCircuitsNCL",
		[ IsInt, IsList ] );

DeclareOperation( "MatroidByRankFunction",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidByRankFunctionNCL",
		[ IsList, IsFunction ] );

DeclareOperation( "MatroidByRankFunction",
		[ IsInt, IsFunction ] );

DeclareOperation( "MatroidByRankFunctionNCL",
		[ IsInt, IsFunction ] );

#DeclareOperation( "MatroidOfGraph",
#		[ IsMatrix ] );

## Special matroids:

DeclareOperationWithDocumentation( "RandomVectorMatroidOverPrimeField",
				[ IsInt, IsInt, IsInt ],
				[ "Returns the vector matroid corresponding to a random <A>k</A> by <A>n</A> matrix ",
				"over the prime field of characteristic <A>p</A>. This method is intended mainly ",
				"for testing purposes." ],
				"a vector matroid",
				"k,n,p",
				[ "Matroids", "Construction" ]
			);

DeclareOperationWithDocumentation( "UniformMatroid",
				[ IsInt, IsInt ],
				[ "Returns the rank <A>k</A> uniform matroid on <A>n</A> elements as an abstract matroid with known rank function." ],
				"an abstract matroid",
				"k,n",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "UniformMatroidNL",
		[ IsInt, IsInt ] );


####################################
##
## Operators
##
####################################

DeclareOperation( "\+",
		[ IsMatroid, IsMatroid ] );

####################################
##
## Attributes
##
####################################

DeclareAttributeWithDocumentation( "DualMatroid",
				IsMatroid,
		 		[ "Computes the dual matroid of <A>mat</A>. If possible, it will be given in the same representation." ],
				"a matroid",
				"mat",
				[ "Matroids", "Construction" ]
			);

DeclareAttribute( "ParentAttr",
		IsMinorOfMatroid );

DeclareAttribute( "SimplifiedMatroid",
		IsMatroid );

DeclareAttributeWithDocumentation( "NormalFormOfVectorMatroid",
				IsMatroid,
				[ "Computes the reduced row echelon form of the underlying matrix of the vector matroid <A>mat</A> ",
				"and returns its columns other than the first occurence of each unit vector along with the ",
				"corresponding column labels. This attribute is mainly intended for internal use." ],
				"a list",
				"mat",
				[ "Matroids", "Accessing_attributes" ]
			);

DeclareOperation( "GroundSet",
		[ IsMatroid ] );

DeclareAttribute( "SizeOfGroundSet",
		IsMatroid );

DeclareAttribute( "RankOfMatroid",
		IsMatroid );

DeclareAttribute( "RankFunction",
		IsMatroid );

DeclareAttribute( "ClosureFunction",
		IsMatroid );

DeclareAttribute( "IndependenceFunction",
		IsMatroid );

DeclareAttributeWithDocumentation( "Bases",
				IsMatroid,
				[ "Computes the bases of <A>mat</A>. For larger matroids this may take a very long time." ],
				"a list of bases",
				"mat",
				[ "Matroids", "Bases,_circuits_and_their_companions" ]
			);

DeclareAttribute( "KnownBases",
		IsMatroid,
		"mutable" );

DeclareAttributeWithDocumentation( "Circuits",
				IsMatroid,
				[ "Computes the circuits of <A>mat</A>. This is done using an incremental polynomial time",
				  "algorithm, so for matroids with many circuits this may take a long time." ],
				"a list of circuits",
				"mat",
				[ "Matroids", "Bases,_circuits_and_their_companions" ]
			);

DeclareAttribute( "KnownCircuits",
		IsMatroid,
		"mutable" );

DeclareAttribute( "FundamentalCircuitsWithBasis",
		IsMatroid );

DeclareAttribute( "Cocircuits",
		IsMatroid );

DeclareAttribute( "Hyperplanes",
		IsMatroid );

DeclareAttribute( "TuttePolynomial",
		IsMatroid );

DeclareAttribute( "RankGeneratingPolynomial",
		IsMatroid );

DeclareAttribute( "Loops",
		IsMatroid );

DeclareAttribute( "Coloops",
		IsMatroid );

DeclareAttribute( "AutomorphismGroup",
		IsMatroid );

DeclareAttribute( "DirectSumDecomposition",
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

DeclareProperty( "IsConnected",
		IsMatroid );


####################################
##
## Methods
##
####################################

DeclareOperation( "SomeBasis",
		[ IsMatroid ] );

DeclareOperationWithDocumentation( "MatrixOfVectorMatroid",
				[ IsMatroid ],
				[ "Returns the homalg matrix which was used to define the vector matroid <A>mat</A>." ],
				"a homalg matrix",
				"mat",
				[ "Matroids", "Accessing_attributes" ]
			);

DeclareOperationWithDocumentation( "Minor",
				[ IsMatroid, IsList, IsList ],
				[ "Computes the minor <A>mat</A> \\ <A>del</A> / <A>con</A> where <A>del</A> and <A>con</A> are subsets of the ground set of <A>mat</A>." ],
				"a matroid",
				"mat,del,con",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "MinorNL",
		[ IsMatroid, IsList, IsList ] );

DeclareOperationWithDocumentation( "Deletion",
				[ IsMatroid, IsList ],
				[ "Computes the minor <A>mat</A> \\ <A>del</A> where <A>del</A> is a subset of the ground set of <A>mat</A>." ],
				"a matroid",
				"mat,del",
				[ "Matroids", "Construction" ]
			);

DeclareOperationWithDocumentation( "Contraction",
				[ IsMatroid, IsList ],
				[ "Computes the minor <A>mat</A> / <A>con</A> where <A>con</A> is a subset of the ground set of <A>mat</A>." ],
				"a matroid",
				"mat,con",
				[ "Matroids", "Construction" ]
			);

DeclareOperation( "IsMinor",
		[ IsMatroid, IsMinorOfMatroid ] );

DeclareOperationWithDocumentation( "DirectSumOfMatroids",
				[ IsMatroid, IsMatroid ],
				[ "Computes the direct sum <A>M1</A> + <A>M2</A> as an abstract matroid.\n\n",
				"DirectSumOfMatroids silently applies DirectSumDecomposition to its arguments." ],
				"a matroid",
				"M1,M2",
				[ "Matroids", "Construction" ]
			);


