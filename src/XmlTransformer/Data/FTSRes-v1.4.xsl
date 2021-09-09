<?xml version="1.0" encoding="utf-8"?>
<xsl:transform
          xmlns:res="http://www.flextronics.com/fts/sfs/res"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	  xmlns:ms="urn:schemas-microsoft-com:xslt"
	  xmlns:flex="urn:schemas-flextronics-com:xslt"
	  version="1.0">

	<xsl:output method="xml" version="1.0" encoding="utf-8"/>

	<ms:script language="JScript" implements-prefix="flex">
	<![CDATA[
		var groupID=1;
		var dutID=1;
		var panelID
		function getGroupID() {return groupID++; }
		function getDUTID() {return dutID++; }
	]]>
	</ms:script>

	<xsl:template match="/">
		<xsl:element name="FLEXFLOW">
			<xsl:apply-templates select="res:BATCH | BATCH" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="res:BATCH | BATCH">
			<xsl:apply-templates select="res:FACTORY | FACTORY" />
			<xsl:apply-templates select="res:REFS | REFS" />
			<xsl:apply-templates select="res:PANEL | PANEL" />

			<xsl:for-each select="res:EXTRA | EXTRA">
				<xsl:call-template name="parseEXTRA">
					<xsl:with-param name="WhatFor">BATCH</xsl:with-param>
					<xsl:with-param name="ParentID"></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

	</xsl:template>

	<xsl:template match="res:FACTORY | FACTORY">
		<xsl:element name="FACTORY">
			<xsl:attribute name="NAME">
				<xsl:value-of select="@NAME" />
			</xsl:attribute>
			<xsl:attribute name="TESTER">
				<xsl:value-of select="@TESTER" />
			</xsl:attribute>
			<xsl:attribute name="FIXTURE">
				<xsl:value-of select="@FIXTURE" />
			</xsl:attribute>
			<xsl:attribute name="USER">
				<xsl:value-of select="@USER" />
			</xsl:attribute>
			<xsl:attribute name="SYSTEMTYPE">
				<xsl:value-of select="@SYSTEMTYPE" />
			</xsl:attribute>
			<xsl:attribute name="TESTCATEGORY">
				<xsl:value-of select="@TESTCATEGORY" />
			</xsl:attribute>
		</xsl:element>
	</xsl:template>

	<!-- 01/11/2006 -->
	<xsl:template match="res:REFS | REFS">
	<xsl:if test="boolean(string(@APP_REF)) or boolean(string(@SEQ_REF)) or boolean(string(@FTS_REF)) or boolean(string(@LIM_REF)) or boolean(string(@CFG_REF)) or boolean(string(@CAL_REF)) or boolean(string(@INSTR_REF))">
		<xsl:element name="REFS">
			<xsl:if test="boolean(string(@APP_REF))">
				<xsl:attribute name="APP_REF">
					<xsl:value-of select="@APP_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@SEQ_REF))">
				<xsl:attribute name="SEQ_REF">
					<xsl:value-of select="@SEQ_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@FTS_REF))">
				<xsl:attribute name="FTS_REF">
					<xsl:value-of select="@FTS_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@LIM_REF))">
				<xsl:attribute name="LIM_REF">
					<xsl:value-of select="@LIM_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@CFG_REF))">
				<xsl:attribute name="CFG_REF">
					<xsl:value-of select="@CFG_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@CAL_REF))">
				<xsl:attribute name="CAL_REF">
					<xsl:value-of select="@CAL_REF" />
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="boolean(string(@INSTR_REF))">
				<xsl:attribute name="INSTR_REF">
					<xsl:value-of select="@INSTR_REF" />
				</xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:if>
	</xsl:template>

	<xsl:template match="res:PANEL | PANEL">
		<xsl:element name="PANEL">
			<xsl:attribute name="ID">
				<xsl:value-of select="@ID" />
			</xsl:attribute>
			<xsl:attribute name="COMMENT">
				<xsl:value-of select="@COMMENT" />
			</xsl:attribute>
			<xsl:attribute name="RUNMODE">
				<xsl:value-of select="@RUNMODE" />
			</xsl:attribute>
			<xsl:attribute name="TIMESTAMP">
				<xsl:value-of select="@TIMESTAMP" />
			</xsl:attribute>
			<xsl:attribute name="TESTTIME">
				<xsl:value-of select="@TESTTIME" />
			</xsl:attribute>
			<xsl:attribute name="WAITTIME">
				<xsl:value-of select="@WAITTIME" />
			</xsl:attribute>
			<xsl:attribute name="STATUS">
				<xsl:value-of select="@STATUS" />
			</xsl:attribute>
		</xsl:element>
		<xsl:apply-templates select="res:DUT | DUT" />

		<xsl:for-each select="res:EXTRA | EXTRA">
			<xsl:call-template name="parseEXTRA">
				<xsl:with-param name="WhatFor">PANEL</xsl:with-param>
				<xsl:with-param name="ParentID"></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>

	</xsl:template>

	<xsl:template match="res:DUT | DUT">
		<xsl:variable name="UID" select="flex:getDUTID()" />
		<xsl:element name="DUT">
			<xsl:attribute name="ID">
				<xsl:value-of select="@ID" />
			</xsl:attribute>
			<xsl:attribute name="UID">
				<xsl:value-of select="$UID" />
			</xsl:attribute>
			<xsl:attribute name="STATUS">
				<xsl:value-of select="@STATUS" />
			</xsl:attribute>
			<xsl:attribute name="TIMESTAMP">
				<xsl:value-of select="@TIMESTAMP" />
			</xsl:attribute>
      <xsl:attribute name="ENDTIME">
        <xsl:value-of select="@ENDTIME" />
      </xsl:attribute>
			<xsl:attribute name="TESTTIME">
				<xsl:value-of select="@TESTTIME" />
			</xsl:attribute>
			<xsl:attribute name="PANELIDX">
				<xsl:value-of select="@PANEL" /> <!--PANEL_POS -->
			</xsl:attribute>
			<xsl:attribute name="SOCKET">
				<xsl:value-of select="@SOCKET" />
			</xsl:attribute>
			<xsl:attribute name="COMMENT">
				<xsl:value-of select="@COMMENT" />
			</xsl:attribute>
		</xsl:element>
		<xsl:for-each select='res:GROUP | GROUP'>
			<xsl:call-template name="parseGroup">
				<xsl:with-param name="dutID"><xsl:value-of select="$UID"/></xsl:with-param>
				<xsl:with-param name="parentID" />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="res:EXTRA | EXTRA">
			<xsl:call-template name="parseEXTRA">
				<xsl:with-param name="WhatFor">DUT</xsl:with-param>
				<xsl:with-param name="ParentID"><xsl:value-of select="$UID"/></xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>

	</xsl:template>

	<xsl:template name="parseGroup">
	<xsl:param name="dutID" />
	<xsl:param name="parentID" />
		<xsl:choose>
		<xsl:when test='name()="GROUP"'>
			<xsl:variable name="UID" select="flex:getGroupID()" />
			<xsl:element name="GROUP">
				<xsl:attribute name="UID">
					<xsl:value-of select="$UID" />
				</xsl:attribute>
				<xsl:attribute name="DUT">
					<xsl:value-of select="$dutID" />
				</xsl:attribute>
				<xsl:attribute name ="PARENT">
					<xsl:value-of select="$parentID" />
				</xsl:attribute>
				<xsl:attribute name ="DESCR">
					<xsl:value-of select="@DESCRIPTION" />
				</xsl:attribute>
				<xsl:attribute name="NAME">
					<xsl:value-of select="@NAME" />
				</xsl:attribute>
				<xsl:attribute name="STEPGROUP">
					<xsl:value-of select="@STEPGROUP" />
				</xsl:attribute>
				<xsl:attribute name="GROUPIDX">
					<xsl:value-of select="@GROUPINDEX" />
				</xsl:attribute>
				<xsl:attribute name="LOOPIDX">
					<xsl:value-of select="@LOOPINDEX" />
				</xsl:attribute>
				<xsl:attribute name="TYPE">
					<xsl:value-of select="@TYPE" />
				</xsl:attribute>
				<xsl:attribute name="RESOURCE">
					<xsl:value-of select="@RESOURCE" />
				</xsl:attribute>
				<xsl:attribute name="MODULETIME">
					<xsl:value-of select="@MODULETIME" />
				</xsl:attribute>
				<xsl:attribute name="TOTALTIME">
					<xsl:value-of select="@TOTALTIME" />
				</xsl:attribute>
				<xsl:attribute name="TIMESTAMP">
					<xsl:value-of select="@TIMESTAMP" />
				</xsl:attribute>
				<xsl:attribute name="STATUS">
					<xsl:value-of select="@STATUS" />
				</xsl:attribute>
				<xsl:attribute name="COMMENT">
					<xsl:value-of select="@COMMENT" />
				</xsl:attribute>
			</xsl:element>
			<xsl:for-each select="res:TEST | TEST">
				<xsl:call-template name="parseTest">
					<xsl:with-param name="dutID"><xsl:value-of select="$dutID"/></xsl:with-param>
					<xsl:with-param name="groupID"><xsl:value-of select="$UID"/></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="res:EXTRA | EXTRA">
				<xsl:call-template name="parseEXTRA">
					<xsl:with-param name="WhatFor">GROUP</xsl:with-param>
					<xsl:with-param name="ParentID"><xsl:value-of select="$UID"/></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select='res:GROUP | GROUP'>
				<xsl:call-template name="parseGroup">
					<xsl:with-param name="dutID"><xsl:value-of select="$dutID"/></xsl:with-param>
					<xsl:with-param name="parentID"><xsl:value-of select="$UID"/></xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:when>
	</xsl:choose>
	</xsl:template>

	<xsl:template name="parseTest">
	<xsl:param name="dutID" />
	<xsl:param name="groupID" />
		<xsl:choose>
		<xsl:when test='name()="TEST"'>
			<xsl:element name="TEST">
				<xsl:attribute name="NAME">
					<xsl:value-of select="@NAME" />
				</xsl:attribute>
				<xsl:attribute name="DUT">
					<xsl:value-of select="$dutID" />
				</xsl:attribute>
				<xsl:attribute name="GROUP">
					<xsl:value-of select="$groupID" />
				</xsl:attribute>
				<xsl:attribute name="STATUS">
					<xsl:value-of select="@STATUS" />
				</xsl:attribute>
				<xsl:if test="boolean(string(@DESCRIPTION))">
					<xsl:attribute name="DESCRIPTION">
					<xsl:choose>  <!--06/02/2006 -->
						<xsl:when test="boolean(string(@DESCRIPTION))">
							<xsl:value-of select="@DESCRIPTION" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@NAME" />
						</xsl:otherwise>
					</xsl:choose>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="boolean(string(@HILIM))">
					<xsl:attribute name="HILIM">
						<xsl:value-of select="@HILIM" />
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="boolean(string(@LOLIM))">
					<xsl:attribute name="LOLIM">
						<xsl:value-of select="@LOLIM" />
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="UNIT">
					<xsl:value-of select="@UNIT" />
				</xsl:attribute>
				<xsl:attribute name="VALUE">
					<xsl:value-of select="@VALUE" />
				</xsl:attribute>
				<xsl:attribute name="RULE">
					<xsl:value-of select="@RULE" />
				</xsl:attribute>
				<xsl:attribute name="TARGET">
					<xsl:value-of select="@TARGET" />
				</xsl:attribute>
				<xsl:attribute name="DATATYPE">
					<xsl:value-of select="@DATATYPE" />
				</xsl:attribute>
				<xsl:if test="boolean(string(@FAILURECODE))">
					<xsl:attribute name="FAILURECODE">
						<xsl:value-of select="@FAILURECODE" />
					</xsl:attribute>
				</xsl:if>
					<xsl:if test="boolean(string(@REMARK))">
					<xsl:attribute name="REMARK">
						<xsl:value-of select="@REMARK" />
					</xsl:attribute>
				</xsl:if>

			</xsl:element>
		</xsl:when>
	</xsl:choose>
	</xsl:template>

	<xsl:template name="parseEXTRA">
	<xsl:param name="WhatFor" />
	<xsl:param name="ParentID" select="0" />
		<xsl:choose>
		<xsl:when test='name()="EXTRA"'>
			<xsl:for-each select="attribute::*">
				<xsl:element name="EXTRA">
					<xsl:attribute name="FOR">
						<xsl:value-of select="$WhatFor" />
					</xsl:attribute>
					<xsl:if test="boolean(string($ParentID))">
						<xsl:attribute name="PID">
							<xsl:value-of select="$ParentID" />
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="TAG" >
						<xsl:value-of select="name()" />
					</xsl:attribute>
					<xsl:attribute name="VAL" >
						<xsl:value-of select="." />
					</xsl:attribute>
				</xsl:element>
			</xsl:for-each>
		</xsl:when>
	</xsl:choose>
	</xsl:template>

</xsl:transform>

<!-- update April 28 2003 Parse EXTRA -->
<!-- update May 30, 2003 removed @LOOPINDEX=-1 when parse GROUP -->
<!-- update 02/23/2005 added COMMENT in DUT -->
<!-- update 02/23/2005 added res namespace for .NET API to work) -->
<!-- update 01/18/2006 parsed REFS -->
<!-- update 03/14/2006 added res:BATCH | BATCH so test result can be parsed in case no namespace is mentioned -->
<!-- update 06/02/2006 returned NAME (for TEST) if DESCRIPTION is blank-->

