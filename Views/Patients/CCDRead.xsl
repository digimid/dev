<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n3="http://www.w3.org/1999/xhtml" xmlns:n1="urn:hl7-org:v3" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>

  <!-- CCD document -->

  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="/n1:ClinicalDocument/n1:title">
        <xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
      </xsl:when>
      <xsl:otherwise>Clinical Document</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template match="/">
    <xsl:apply-templates select="n1:ClinicalDocument"/>
  </xsl:template>

  <xsl:template match="n1:ClinicalDocument">
    <html>
      <head>
        <xsl:comment>Comments here</xsl:comment>
        <title>
          <xsl:value-of select="$title"/>
        </title>
      </head>
      <body>
        <div class="row">
          <div class="small-6 columns">
            <h5>
              <xsl:value-of select="$title"/>
            </h5>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <b>
                <xsl:text>Patient ID</xsl:text>
              </b>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id/@extension"/>
            </label>
          </div>
          <div class="small-5 columns end">
            <label class="inline">
              <b>
                Additional Patient Information
              </b>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Patient Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[1]"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[2]"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[1]"/>
            </label>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Gender</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@displayName"/>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Address</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:streetAddressLine[1]"/>
            </label>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Date of Birth</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:call-template name="formatDate">
                <xsl:with-param name="date"
       select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
              </xsl:call-template>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            &#160;
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:streetAddressLine[2]"/>
            </label>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Marital Status</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@displayName"/>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>City</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:city"/>
            </label>
          </div>
          <div class="small-5 columns end">
            <hr/>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>State</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state"/>
            </label>
          </div>
          <div class="small-5 columns end">
            <label class="inline">
              <b>
                Next of Kin
              </b>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Zip Code</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:postalCode"/>
            </label>
          </div>
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Full Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:associatedPerson/n1:name"/>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Phone</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:telecom/@value"/>
            </label>
          </div>
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Relationship</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <label class="inline">
              <xsl:value-of select="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@displayName"/>
            </label>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>



  <!--  Format Date outputs a date in Month Day, Year form e.g., 19991207  ==> December 07, 1999  -->
  <xsl:template name="formatDate">
    <xsl:param name="date"/>
    <xsl:variable name="month" select="substring ($date, 5, 2)"/>
    <xsl:choose>
      <xsl:when test="$month='01'">
        <xsl:text>January </xsl:text>
      </xsl:when>
      <xsl:when test="$month='02'">
        <xsl:text>February </xsl:text>
      </xsl:when>
      <xsl:when test="$month='03'">
        <xsl:text>March </xsl:text>
      </xsl:when>
      <xsl:when test="$month='04'">
        <xsl:text>April </xsl:text>
      </xsl:when>
      <xsl:when test="$month='05'">
        <xsl:text>May </xsl:text>
      </xsl:when>
      <xsl:when test="$month='06'">
        <xsl:text>June </xsl:text>
      </xsl:when>
      <xsl:when test="$month='07'">
        <xsl:text>July </xsl:text>
      </xsl:when>
      <xsl:when test="$month='08'">
        <xsl:text>August </xsl:text>
      </xsl:when>
      <xsl:when test="$month='09'">
        <xsl:text>September </xsl:text>
      </xsl:when>
      <xsl:when test="$month='10'">
        <xsl:text>October </xsl:text>
      </xsl:when>
      <xsl:when test="$month='11'">
        <xsl:text>November </xsl:text>
      </xsl:when>
      <xsl:when test="$month='12'">
        <xsl:text>December </xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test='substring ($date, 7, 1)="0"'>
        <xsl:value-of select="substring ($date, 8, 1)"/>
        <xsl:text>, </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring ($date, 7, 2)"/>
        <xsl:text>, </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="substring ($date, 1, 4)"/>
  </xsl:template>

  <xsl:template name="getRelationshipName">
    <xsl:param name="relationship"/>
    <xsl:choose>
      <xsl:when test="$relationship='CHLDADOPT'">
        <xsl:text>Adopted Child</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='DAUADOPT'">
        <xsl:text>Adopted Daughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SONADOPT'">
        <xsl:text>Adopted Son</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='AUNT'">
        <xsl:text>Aunt</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='BRO'">
        <xsl:text>Brother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='BROINLAW'">
        <xsl:text>Brother-In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- CHILD'">
        <xsl:text>Child</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='CHLDINLAW'">
        <xsl:text>Child In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='COUSN'">
        <xsl:text>Cousin</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='DAUC'">
        <xsl:text>Daughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='DAUINLAW'">
        <xsl:text>Daughter In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- - DOMPART'">
        <xsl:text>Domestic Partner</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='ECON'">
        <xsl:text>Emergency Contact</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- EXT'">
        <xsl:text>Extended Family Member</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='FAMMEMB'">
        <xsl:text>Family Member</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='FTH'">
        <xsl:text>Father</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='FTHINLAW'">
        <xsl:text>Father-In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='CHLDFOST'">
        <xsl:text>Foster Child</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='DAUFOST'">
        <xsl:text>Foster Daughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SONFOST'">
        <xsl:text>Foster Son</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRNDCHILD'">
        <xsl:text>Grandchild</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRNDDAU'">
        <xsl:text>Granddaughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRFTH'">
        <xsl:text>Grandfather</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRMTH'">
        <xsl:text>Grandmother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRPRN'">
        <xsl:text>Grandparent</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GRNDSON'">
        <xsl:text>Grandson</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GGRFTH'">
        <xsl:text>Great Grandfather</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GGRMTH'">
        <xsl:text>Great Grandmother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GGRPRN'">
        <xsl:text>Great Grandparent</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='GUARD'">
        <xsl:text>Guardian</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='HBRO'">
        <xsl:text>Half-Brother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='HSIB'">
        <xsl:text>Half-Sibling</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='HSIS'">
        <xsl:text>Half-Sister</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='HUSB'">
        <xsl:text>Husband</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- IMED'">
        <xsl:text>Immediate Family</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='MTH'">
        <xsl:text>Mother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='MTHINLAW'">
        <xsl:text>Mother-In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NBRO'">
        <xsl:text>Natural Brother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NCHILD'">
        <xsl:text>Natural Child</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='DAU'">
        <xsl:text>Natural Daughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NFTH'">
        <xsl:text>Natural Father</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NFTHF'">
        <xsl:text>Natural Father Of Fetus</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NMTH'">
        <xsl:text>Natural Mother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NPRN'">
        <xsl:text>Natural Parent</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NSIB'">
        <xsl:text>Natural Sibling</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NSIS'">
        <xsl:text>Natural Sister</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SON'">
        <xsl:text>Natural Son</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NBOR'">
        <xsl:text>Neighbor</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NEPHEW'">
        <xsl:text>Nephew</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NOK'">
        <xsl:text>Next Of Kin</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NIECE'">
        <xsl:text>Niece</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='NIENEPH'">
        <xsl:text>Niece/Nephew</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- PRN'">
        <xsl:text>Parent</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='PRNINLAW'">
        <xsl:text>Parent In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='POWATY'">
        <xsl:text>Power Of Attorney</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='POWATYPR'">
        <xsl:text>Power Of Attorney-Personal</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='POWATYPT'">
        <xsl:text>Power Of Attorney-Property</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='ROOM'">
        <xsl:text>Roomate</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- SIB'">
        <xsl:text>Sibling</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SIBINLAW'">
        <xsl:text>Sibling In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- SIGOTHR'">
        <xsl:text>Significant Other</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SIS'">
        <xsl:text>Sister</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SISINLAW'">
        <xsl:text>Sister-In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SONC'">
        <xsl:text>Son</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SONINLAW'">
        <xsl:text>Son In-Law</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='- - SPS'">
        <xsl:text>Spouse</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPCHLD'">
        <xsl:text>Step Child</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPPRN'">
        <xsl:text>Step Parent</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPSIB'">
        <xsl:text>Step Sibling</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPBRO'">
        <xsl:text>Stepbrother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPDAU'">
        <xsl:text>Stepdaughter</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPFTH'">
        <xsl:text>Stepfather</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPMTH'">
        <xsl:text>Stepmother</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPSIS'">
        <xsl:text>Stepsister</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='STPSON'">
        <xsl:text>Stepson</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='SUBDM'">
        <xsl:text>Substitute Decision Maker</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='UNCLE'">
        <xsl:text>Uncle</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='FRND'">
        <xsl:text>Unrelated Friend</xsl:text>
      </xsl:when>
      <xsl:when test="$relationship='WIFE'">
        <xsl:text>Wife</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Undefined</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
