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
              <xsl:text>Patient ID: </xsl:text>
              <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id/@extension"/>
            </h5>
          </div>
          <div class="small-6 columns">
            <a class="button tiny radius right cancel-button" href="/Patients">Cancel</a>
          </div>
        </div>
        <hr/>
        <div class="row">
          <div class="small-2 columns">
            <label class="right">
              <label>
                <b>Patient Amendment?</b>
              </label>
            </label>
          </div>
          <div class="small-3 columns">
            <input type="radio" name="patient_ammendment" id="patient_ammendmentYes" value="Yes"/>
            <label for="patient_ammendmentYes">Yes</label>
            <input type="radio" name="patient_ammendment" id="patient_ammendmentNo" value="No" checked="checked"/>
            <label for="patient_ammendmentNo">No</label>
          </div>
          <div class="small-5 columns end">
            <label class="right">
              <b>
                Additional Patient Information
              </b>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>First Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <input type="text" name="patient_first_name" placeholder="First Name" class="span2" required="required">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[1]"/>
              </xsl:attribute>
            </input>
            <input id="patient_initial" name="patient_initial" type="hidden" value="{/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[2]}"/>
          </div>
          <div class="small-2 columns">
            <label class="inline right">
              <xsl:text>Gender</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_gender" name="patient_gender" required="required" class="span4">
              <option disabled="disabled" selected="selected">Choose</option>
              <option value="F">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code='F'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Female
              </option>
              <option value="M">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code='M'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Male
              </option>
              <option value="UN">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code='UN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Undifferentiated
              </option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Last Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns">
            <input type="text" name="patient_last_Name" placeholder="Last Name" class="span2" required="required">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[1]"/>
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
              <input id="patient_dob"  name="patient_dob" size="16" type="text" required="required">
                <xsl:attribute name="value">
                  <xsl:call-template name="formatDateShort">
                    <xsl:with-param name="date"
           select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
                  </xsl:call-template>
                </xsl:attribute>
              </input>
              <span class="add-on">
                <i class="fa fa-th"></i>
              </span>
            </div>
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
              <xsl:text>Marital Status</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_marital_status" name="patient_marital_status" required="required" class="span4">
              <option value="A">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='A'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Separated
              </option>
              <option value="D">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='D'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Divorced
              </option>
              <option value="M">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='M'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Married
              </option>
              <option value="S">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='S'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Single
              </option>
              <option value="W">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='W'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Widowed
              </option>
              <option value="G">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='G'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Living Together
              </option>
              <option value="P">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='P'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Domestic Partner
              </option>
              <option value="U">
                <xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:maritalStatusCode/@code='U'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Unknown
              </option>
            </select>
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
          <div class="small-5 columns end">
            <hr/>
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
          <div class="small-2 columns">
            <label class="right inline">
              <xsl:text>Full Name</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <input id="patient_nok_name" name="patient_nok_name" type="text" required="required" value="">
              <xsl:attribute name='value'>
                <xsl:value-of select="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:associatedPerson/n1:name"/>
              </xsl:attribute>
            </input>
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
              <xsl:text>Relationship</xsl:text>
            </label>
          </div>
          <div class="small-3 columns end">
            <select id="patient_nok_relationship" name="patient_nok_relationship" class="span4" required="required">
              <option disabled="disabled" selected="selected">Choose</option>
              <option value="CHLDADOPT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='CHLDADOPT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Adopted Child
              </option>
              <option value="DAUADOPT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='DAUADOPT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Adopted Daughter
              </option>
              <option value="SONADOPT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SONADOPT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Adopted Son
              </option>
              <option value="AUNT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='AUNT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Aunt
              </option>
              <option value="BRO">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='BRO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Brother
              </option>
              <option value="BROINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='BROINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Brother-In-Law
              </option>
              <option value="- CHILD">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- CHILD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Child
              </option>
              <option value="CHLDINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='CHLDINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Child In-Law
              </option>
              <option value="COUSN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='COUSN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Cousin
              </option>
              <option value="DAUC">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='DAUC'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Daughter
              </option>
              <option value="DAUINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='DAUINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Daughter In-Law
              </option>
              <option value="- - DOMPART">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- - DOMPART'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Domestic Partner
              </option>
              <option value="ECON">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='ECON'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Emergency Contact
              </option>
              <option value="- EXT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- EXT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Extended Family Member
              </option>
              <option value="FAMMEMB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='FAMMEMB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Family Member
              </option>
              <option value="FTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='FTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Father
              </option>
              <option value="FTHINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='FTHINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Father-In-Law
              </option>
              <option value="CHLDFOST">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='CHLDFOST'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Foster Child
              </option>
              <option value="DAUFOST">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='DAUFOST'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Foster Daughter
              </option>
              <option value="SONFOST">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SONFOST'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Foster Son
              </option>
              <option value="GRNDCHILD">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRNDCHILD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Grandchild
              </option>
              <option value="GRNDDAU">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRNDDAU'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Granddaughter
              </option>
              <option value="GRFTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRFTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Grandfather
              </option>
              <option value="GRMTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRMTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Grandmother
              </option>
              <option value="GRPRN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRPRN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Grandparent
              </option>
              <option value="GRNDSON">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GRNDSON'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Grandson
              </option>
              <option value="GGRFTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GGRFTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Great Grandfather
              </option>
              <option value="GGRMTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GGRMTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Great Grandmother
              </option>
              <option value="GGRPRN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GGRPRN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Great Grandparent
              </option>
              <option value="GUARD">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='GUARD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Guardian
              </option>
              <option value="HBRO">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='HBRO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Half-Brother
              </option>
              <option value="HSIB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='HSIB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Half-Sibling
              </option>
              <option value="HSIS">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='HSIS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Half-Sister
              </option>
              <option value="HUSB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='HUSB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Husband
              </option>
              <option value="- IMED">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- IMED'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Immediate Family
              </option>
              <option value="MTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='MTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Mother
              </option>
              <option value="MTHINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='MTHINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Mother-In-Law
              </option>
              <option value="NBRO">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NBRO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Brother
              </option>
              <option value="NCHILD">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NCHILD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Child
              </option>
              <option value="DAU">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='DAU'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Daughter
              </option>
              <option value="NFTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NFTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Father
              </option>
              <option value="NFTHF">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NFTHF'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Father Of Fetus
              </option>
              <option value="NMTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NMTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Mother
              </option>
              <option value="NPRN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NPRN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Parent
              </option>
              <option value="NSIB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NSIB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Sibling
              </option>
              <option value="NSIS">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NSIS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Sister
              </option>
              <option value="SON">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SON'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Natural Son
              </option>
              <option value="NBOR">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NBOR'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Neighbor
              </option>
              <option value="NEPHEW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NEPHEW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Nephew
              </option>
              <option value="NOK">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NOK'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Next Of Kin
              </option>
              <option value="NIECE">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NIECE'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Niece
              </option>
              <option value="NIENEPH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='NIENEPH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Niece/Nephew
              </option>
              <option value="- PRN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- PRN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Parent
              </option>
              <option value="PRNINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='PRNINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Parent In-Law
              </option>
              <option value="POWATY">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='POWATY'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Power Of Attorney
              </option>
              <option value="POWATYPR">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='POWATYPR'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Power Of Attorney-Personal
              </option>
              <option value="POWATYPT">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='POWATYPT'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Power Of Attorney-Property
              </option>
              <option value="ROOM">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='ROOM'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Roomate
              </option>
              <option value="- SIB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- SIB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Sibling
              </option>
              <option value="SIBINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SIBINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Sibling In-Law
              </option>
              <option value="- SIGOTHR">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- SIGOTHR'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Significant Other
              </option>
              <option value="SIS">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SIS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Sister
              </option>
              <option value="SISINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SISINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Sister-In-Law
              </option>
              <option value="SONC">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SONC'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Son
              </option>
              <option value="SONINLAW">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SONINLAW'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Son In-Law
              </option>
              <option value="- - SPS">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='- - SPS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Spouse
              </option>
              <option value="STPCHLD">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPCHLD'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Step Child
              </option>
              <option value="STPPRN">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPPRN'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Step Parent
              </option>
              <option value="STPSIB">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPSIB'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Step Sibling
              </option>
              <option value="STPBRO">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPBRO'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepbrother
              </option>
              <option value="STPDAU">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPDAU'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepdaughter
              </option>
              <option value="STPFTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPFTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepfather
              </option>
              <option value="STPMTH">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPMTH'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepmother
              </option>
              <option value="STPSIS">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPSIS'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepsister
              </option>
              <option value="STPSON">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='STPSON'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Stepson
              </option>
              <option value="SUBDM">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='SUBDM'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Substitute Decision Maker
              </option>
              <option value="UNCLE">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='UNCLE'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Uncle
              </option>
              <option value="FRND">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='FRND'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Unrelated Friend
              </option>
              <option value="WIFE">
                <xsl:if test="/n1:ClinicalDocument/n1:participant/n1:associatedEntity/n1:code/@code='WIFE'">
                  <xsl:attribute name="selected">Selected</xsl:attribute>
                </xsl:if>Wife
              </option>
            </select>
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
          <div class="small-5 columns end">
            &#160;
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <!--  Format Date outputs a date in Month/Day/Year form e.g., 19991207  ==> 12/07/1999  -->
  <xsl:template name="formatDateShort">
    <xsl:param name="date"/>
    <xsl:variable name="month" select="substring ($date, 5, 2)"/>
    <xsl:variable name="day" select="substring ($date, 7, 2)"/>
    <xsl:variable name="year" select="substring ($date, 1, 4)"/>
    <xsl:value-of select="concat($month,'/',$day,'/',$year)"/>
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
