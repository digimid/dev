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
          <div class="small-6 columns">
            <a class="button tiny radius right cancel-button" href="/Patients">Cancel</a>
          </div>
        </div>
        <hr/>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <b>
                <xsl:text>Patient ID</xsl:text>
              </b>
            </label>
          </div>
          <div class="small-3 columns">
            <div class="row collapse">
              <div class="small-10 columns">
                <input id="recordid" name="recordid" type="text"></input>
              </div>
              <div class="small-2 columns">
                <a id="id-generator" class="button tiny radius postfix" href="#" title="Enter an ID or click to auto-generate an ID" aria-haspopup="true" data-tooltip="">
                  <i class="fi-loop id-maker"></i>
                </a>
              </div>
            </div>
          </div>
          <div class="small-5 columns end">
            <label class="inline right">
              <b>
                Additional Patient Information
              </b>
            </label>            
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
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
            <input type="hidden" id="patient_first_name" name="patient_first_name">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[1]"/>
              </xsl:attribute>
            </input>
            <input type="hidden" id="patient_initial" name="patient_initial">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[2]"/>
              </xsl:attribute>
            </input>
            <input type="hidden" id="patient_last_name" name="patient_last_name">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[1]"/>
              </xsl:attribute>
            </input>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Gender</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_gender" name="patient_gender" required="required" class="span4">
              <option disabled="disabled" selected="selected">Choose</option>
              <option value="F">Female</option>
              <option value="M">Male</option>
              <option value="UN">Undifferentiated</option>
            </select>
          </div>          
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Address</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <input type="text" name="patient_address1" placeholder="Address Line 1" class="span4" required="required">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:streetAddressLine[1]"/>
              </xsl:attribute>
            </input>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Date of Birth</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">            
            <div class="input-append date" id="dp_dob" data-date-format="mm/dd/yyyy">
              <input id="patient_dob"  name="patient_dob" size="16" type="text" required="required"/>
                <span class="add-on">
                  <i class="fa fa-th"></i>
                </span>
              </div>
          </div>          
        </div>
        <div class="row">
          <div class="small-2 columns">
            &#160;
          </div>
          <div class="small-3 columns end">
            <input type="text" name="patient_address2" placeholder="Address Line 2" class="span4">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:streetAddressLine[2]"/>
              </xsl:attribute>
            </input>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Marital Status</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_marital_status" name="patient_marital_status" required="required" class="span4">
              <option disabled="disabled" selected="selected">Choose</option>
              <option value="A">Separated</option>
              <option value="D">Divorced</option>
              <option value="M">Married</option>
              <option value="S">Single</option>
              <option value="W">Widowed</option>
              <option value="G">Living Together</option>
              <option value="P">Domestic Partner</option>
              <option value="U">Unknown</option>
            </select>
          </div>          
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>City</xsl:text>
            </label>          
          </div>          
          <div class="small-3 columns">
            <input type="text" name="patient_city" placeholder="City" class="span4" required="required">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:city"/>
              </xsl:attribute>
            </input>          
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
            <select id="patient_state" name="patient_state" required="required" class="span2">
              <option value="AL">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='AL'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Alabama
              </option>
              <option value="AK">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='AK'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Alaska
              </option>
              <option value="AZ">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='AZ'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Arizona
              </option>
              <option value="AR">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='AR'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Arkansas
              </option>
              <option value="CA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='CA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>California
              </option>
              <option value="CO">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='CO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Colorado
              </option>
              <option value="CT">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='CT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Connecticut
              </option>
              <option value="DE">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='DE'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Delaware
              </option>
              <option value="DC">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='DC'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>District Of Columbia
              </option>
              <option value="FL">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='FL'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Florida
              </option>
              <option value="GA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='GA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Georgia
              </option>
              <option value="HI">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='HI'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Hawaii
              </option>
              <option value="ID">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='ID'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Idaho
              </option>
              <option value="IL">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='IL'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Illinois
              </option>
              <option value="IN">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='IN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Indiana
              </option>
              <option value="IA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='IA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Iowa
              </option>
              <option value="KS">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='KS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Kansas
              </option>
              <option value="KY">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='KY'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Kentucky
              </option>
              <option value="LA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='LA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Louisiana
              </option>
              <option value="ME">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='ME'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Maine
              </option>
              <option value="MD">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Maryland
              </option>
              <option value="MA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Massachusetts
              </option>
              <option value="MI">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MI'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Michigan
              </option>
              <option value="MN">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Minnesota
              </option>
              <option value="MS">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Mississippi
              </option>
              <option value="MO">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Missouri
              </option>
              <option value="MT">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='MT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Montana
              </option>
              <option value="NE">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NE'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Nebraska
              </option>
              <option value="NV">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NV'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Nevada
              </option>
              <option value="NH">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>New Hampshire
              </option>
              <option value="NJ">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NJ'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>New Jersey
              </option>
              <option value="NM">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NM'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>New Mexico
              </option>
              <option value="NY">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NY'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>New York
              </option>
              <option value="NC">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='NC'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>North Carolina
              </option>
              <option value="ND">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='ND'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>North Dakota
              </option>
              <option value="OH">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='OH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Ohio
              </option>
              <option value="OK">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='OK'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Oklahoma
              </option>
              <option value="OR">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='OR'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Oregon
              </option>
              <option value="PA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='PA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Pennsylvania
              </option>
              <option value="RI">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='RI'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Rhode Island
              </option>
              <option value="SC">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='SC'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>South Carolina
              </option>
              <option value="SD">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='SD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>South Dakota
              </option>
              <option value="TN">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='TN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Tennessee
              </option>
              <option value="TX">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='TX'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Texas
              </option>
              <option value="UT">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='UT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Utah
              </option>
              <option value="VT">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='VT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Vermont
              </option>
              <option value="VA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='VA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Virginia
              </option>
              <option value="WA">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='WA'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Washington
              </option>
              <option value="WV">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='WV'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>West Virginia
              </option>
              <option value="WI">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='WI'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Wisconsin
              </option>
              <option value="WY">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:state='WY'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Wyoming
              </option>
            </select>
          </div>
          <div class="small-5 columns end">
            <label class="inline right">
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
            <input type="text" name="patient_zip" placeholder="Zip Code" class="span2" required="required">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr/n1:postalCode"/>
              </xsl:attribute>
            </input>
          </div>
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Full Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <input id="patient_nok_name" name="patient_nok_name" type="text" required="required"/>
          </div>          
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Phone</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <input id="patient_phone" name="patient_phone" type="text" required="required" class="span4">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:telecom/@value"/>
              </xsl:attribute>
            </input>
          </div>
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Relationship</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_nok_relationship" name="patient_nok_relationship" class="span4" required="required">
              <option disabled="disabled" selected="selected">Choose</option>
              <option value="CHLDADOPT">Adopted Child</option>
              <option value="DAUADOPT">Adopted Daughter</option>
              <option value="SONADOPT">Adopted Son</option>
              <option value="AUNT">Aunt</option>
              <option value="BRO">Brother</option>
              <option value="BROINLAW">Brother-In-Law</option>
              <option value="- CHILD">Child</option>
              <option value="CHLDINLAW">Child In-Law</option>
              <option value="COUSN">Cousin</option>
              <option value="DAUC">Daughter</option>
              <option value="DAUINLAW">Daughter In-Law</option>
              <option value="- - DOMPART">Domestic Partner</option>
              <option value="ECON">Emergency Contact</option>
              <option value="- EXT">Extended Family Member</option>
              <option value="FAMMEMB">Family Member</option>
              <option value="FTH">Father</option>
              <option value="FTHINLAW">Father-In-Law</option>
              <option value="CHLDFOST">Foster Child</option>
              <option value="DAUFOST">Foster Daughter</option>
              <option value="SONFOST">Foster Son</option>
              <option value="GRNDCHILD">Grandchild</option>
              <option value="GRNDDAU">Granddaughter</option>
              <option value="GRFTH">Grandfather</option>
              <option value="GRMTH">Grandmother</option>
              <option value="GRPRN">Grandparent</option>
              <option value="GRNDSON">Grandson</option>
              <option value="GGRFTH">Great Grandfather</option>
              <option value="GGRMTH">Great Grandmother</option>
              <option value="GGRPRN">Great Grandparent</option>
              <option value="GUARD">Guardian</option>
              <option value="HBRO">Half-Brother</option>
              <option value="HSIB">Half-Sibling</option>
              <option value="HSIS">Half-Sister</option>
              <option value="HUSB">Husband</option>
              <option value="- IMED">Immediate Family</option>
              <option value="MTH">Mother</option>
              <option value="MTHINLAW">Mother-In-Law</option>
              <option value="NBRO">Natural Brother</option>
              <option value="NCHILD">Natural Child</option>
              <option value="DAU">Natural Daughter</option>
              <option value="NFTH">Natural Father</option>
              <option value="NFTHF">Natural Father Of Fetus</option>
              <option value="NMTH">Natural Mother</option>
              <option value="NPRN">Natural Parent</option>
              <option value="NSIB">Natural Sibling</option>
              <option value="NSIS">Natural Sister</option>
              <option value="SON">Natural Son</option>
              <option value="NBOR">Neighbor</option>
              <option value="NEPHEW">Nephew</option>
              <option value="NOK">Next Of Kin</option>
              <option value="NIECE">Niece</option>
              <option value="NIENEPH">Niece/Nephew</option>
              <option value="- PRN">Parent</option>
              <option value="PRNINLAW">Parent In-Law</option>
              <option value="POWATY">Power Of Attorney</option>
              <option value="POWATYPR">Power Of Attorney-Personal</option>
              <option value="POWATYPT">Power Of Attorney-Property</option>
              <option value="ROOM">Roomate</option>
              <option value="- SIB">Sibling</option>
              <option value="SIBINLAW">Sibling In-Law</option>
              <option value="- SIGOTHR">Significant Other</option>
              <option value="SIS">Sister</option>
              <option value="SISINLAW">Sister-In-Law</option>
              <option value="SONC">Son</option>
              <option value="SONINLAW">Son In-Law</option>
              <option value="- - SPS">Spouse</option>
              <option value="STPCHLD">Step Child</option>
              <option value="STPPRN">Step Parent</option>
              <option value="STPSIB">Step Sibling</option>
              <option value="STPBRO">Stepbrother</option>
              <option value="STPDAU">Stepdaughter</option>
              <option value="STPFTH">Stepfather</option>
              <option value="STPMTH">Stepmother</option>
              <option value="STPSIS">Stepsister</option>
              <option value="STPSON">Stepson</option>
              <option value="SUBDM">Substitute Decision Maker</option>
              <option value="UNCLE">Uncle</option>
              <option value="FRND">Unrelated Friend</option>
              <option value="WIFE">Wife</option>
            </select>
          </div>
        </div>        
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
