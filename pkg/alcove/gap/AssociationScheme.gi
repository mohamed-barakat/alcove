#############################################################################
##
##  AssocationScheme.gi            alcove package               Martin Leuner
##
##  Copyright 2012 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  Association scheme methods for alcove.
##
#############################################################################

####################################
##
## Representations
##
####################################

DeclareRepresentation( "IsAssociationSchemeByRelationsRep",
	IsAssociationScheme and IsAttributeStoringRep,
	[ "groundSet", "relations" ]
);

DeclareRepresentation( "IsAssociationSchemeByFunctionsRep",
	IsAssociationScheme and IsAttributeStoringRep,
	[ "groundSet", "functions" ]
);

DeclareRepresentation( "IsAssociationSchemeByActionRep",
	IsAssociationScheme and IsAttributeStoringRep,
	[ "group", "groundSet", "action" ]
);

DeclareRepresentation( "IsAssociationSchemeByGroupRep",
	IsAssociationScheme and IsAttributeStoringRep,
	[ "group" ]
);


####################################
##
## Types and Families
##
####################################


BindGlobal( "TheFamilyOfAssociationSchemes",
	NewFamily( "TheFamilyOfAssociationSchemes" , IsAssociationScheme ) );

BindGlobal( "TheTypeRelationAssociationScheme",
	NewType( TheFamilyOfAssociationSchemes, IsAssociationSchemeByRelationsRep ) );

BindGlobal( "TheTypeFunctionAssociationScheme",
	NewType( TheFamilyOfAssociationSchemes, IsAssociationSchemeByFunctionsRep ) );

BindGlobal( "TheTypeActionAssociationScheme",
	NewType( TheFamilyOfAssociationSchemes, IsAssociationSchemeByActionRep ) );

BindGlobal( "TheTypeGroupAssociationScheme",
	NewType( TheFamilyOfAssociationSchemes, IsAssociationSchemeByGroupRep ) );


####################################
##
## Attributes
##
####################################


####################################
##
## Properties
##
####################################


####################################
##
## Methods
##
####################################


####################################
##
## Constructors
##
####################################


##
InstallMethod( AssociationScheme,
		"copy constructor",
		[ IsAssociationScheme ],

 IdFunc

);


##
InstallMethod( AssociationScheme,
		"by ground set and relations",
		[ IsList, IsList ],
		10,

 function( gset, rels )
  local aScheme, srels, sgset;

  if IsEmpty(rels) or not IsList(rels[1]) then TryNextMethod(); fi;

# Sort ground set and relations:
  sgset := Set(gset);
  srels := List( rels, rel -> List( rel, Set ) );

# Check whether relations satisfy conditions:
# TO DO

  aScheme := Objectify( TheTypeRelationAssociationScheme, rec( groundSet := Immutable(sgset), relations := Immutable(srels) ) );

  return aScheme;
 end

);


##
InstallMethod( AssociationScheme,
		"by ground set and functions",
		[ IsList, IsList ],

 function( gset, funcs )
  local aScheme, sgset;

  sgset := Set(gset);

# Check whether relations satisfy conditions:
# TO DO

  aScheme := Objectify( TheTypeFunctionAssociationScheme, rec( groundSet := Immutable(sgset), functions := Immutable(funcs) ) );
 end

);


##
InstallMethod( AssociationScheme,
		"by transitive action",
		[ IsGroup, IsList, IsFunction ],

 function( grp, dom, act )
  local aScheme;

  if not IsTransitive( grp, dom, act ) then
   Error( "<grp> must act transitively on <dom>" );
  fi;

  aScheme := Objectify( TheTypeActionAssociationScheme, rec( group := Immutable(grp), groundSet := Immutable(dom), action := Immutable(act) ) );

  return aScheme;
 end

);


##
InstallMethod( AssociationScheme,
		"by group",
		[ IsGroup ],

 function( grp )
  local aScheme;

  aScheme := Objectify( TheTypeGroupAssociationScheme, rec( group := Immutable(grp) ) );
  SetIsCommutative( aScheme, true );

  return aScheme;
 end

);


####################################
##
## Display Methods
##
####################################

##
InstallMethod( PrintObj,
		"for association schemes",
		[ IsAssociationScheme ],

 function( ascheme )

  if IsAssociationSchemeByGroupRep( ascheme ) then

   Print( "<A group association scheme>" );

  else

   if 	( HasIsCommutative( ascheme ) and IsCommutative( ascheme ) ) or
	( HasIsSymmetric( ascheme ) and IsSymmetric( ascheme ) ) then
    Print( "<A" );
   else
    Print( "<An" );
   fi;

   if HasIsCommutative( ascheme ) and IsCommutative( ascheme ) then
    Print( " commutative" );
   fi;

   if HasIsSymmetric( ascheme ) and IsSymmetric( ascheme ) then
    Print( " symmetric" );
   fi;

   Print( " association scheme>" );

  fi;

 end

);

##
InstallMethod( Display,
		"for group association schemes",
		[ IsAssociationSchemeByGroupRep ],

 function( ascheme )

  Print( "The group association scheme of " );
  Display( GroupOfAssociationScheme( ascheme ) );

 end

);

##
InstallMethod( Display,
		"for action association schemes",
		[ IsAssociationSchemeByActionRep ],

 function( ascheme )

  Print( "The association scheme for the action of " );
  Display( GroupOfAssociationScheme( ascheme ) );
  Print( " on " );
  Display( GroundSet( ascheme ) );
  Print( " via ", ActionOfAssociationScheme( ascheme ), "." );

 end

);

##
InstallMethod( Display,
		"for relation association schemes",
		[ IsAssociationSchemeByRelationsRep ],

 function( ascheme )

  Print( "The association scheme on " );
  Display( GroundSet( ascheme ) );
  Print( " with relations defined by " );
  Display( RelationsOfAssociationScheme( ascheme ) );

 end

);

##
InstallMethod( Display,
		"for function association schemes",
		[ IsAssociationSchemeByFunctionsRep  ],

 function( ascheme )

  Print( "The association scheme on " );
  Display( GroundSet( ascheme ) );
  Print( " with relations defined by " );
  Display( RelationsOfAssociationScheme( ascheme ) );

 end

);

