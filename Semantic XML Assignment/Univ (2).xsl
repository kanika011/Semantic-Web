<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body bgcolor="#E6E6FA">
  <div font-size="30"><center><strong>Arizona State University</strong></center></div>
	<xsl:apply-templates select="university/campus" />
	</body>
	</html>
	</xsl:template>
	
	<xsl:template match="university/campus">
	<center><strong><xsl:value-of select="@name" /></strong></center>
	<ol>
	<li><b> The professors at ASU <xsl:value-of select="@name" /> who are hiring for research work are:</b><br/><br />
	  <table border="4">
	  <tr bgcolor="#EE82EE">
		  <th>First Name</th>
	      <th>Last Name</th>
		  <th>Email</th>
		  <th>Phone</th>
		  <th>Designation</th>
		  <th>Office Location</th>
		  <th>Research</th>
		  <th>Hiring</th>
	    </tr>
	  <xsl:for-each select="department/faculty/lecturer">
	    <xsl:if test="Hiring &gt; 0">
	    <tr>
	      <td><xsl:value-of select="firstName"/></td>
	      <td><xsl:value-of select="lastName"/></td>
	      <td><xsl:value-of select="email"/></td>
		  <td><xsl:value-of select="phone"/></td>
		  <td><xsl:value-of select="designation"/></td>
		  <td><xsl:value-of select="office_location"/></td>
		  <td><xsl:value-of select="research"/></td>
		  <td><xsl:value-of select="Hiring"/></td>
	    </tr>
	    </xsl:if>
	    </xsl:for-each>
	  </table>
	 	</li>
	 		<br/> <br/>
		<li>  
	  <ul>
	    <b>Students involved in research are</b>
	    <xsl:for-each select="department/student">
	    <li> <xsl:value-of select="studentName" /></li>
	    <xsl:choose>
	     <xsl:when test="marks > 90">
		         High Research
		      </xsl:when>
	    <xsl:when test="marks > 70">
		         Normal Research
		</xsl:when>
		      <xsl:otherwise>
		         Documentation
		      </xsl:otherwise>
	      </xsl:choose>
	    </xsl:for-each>
	  </ul>
	  </li>
	  <br /> <br />
	  <li> The library at ASU campus are <xsl:value-of select="//library" />.
	  The cafeteria at ASU campus are <xsl:value-of select="//cafeteria" />.</li>
	  <br /> <br />
    <li><b>Courses at ASU <xsl:value-of select="@name" /></b>
    <xsl:apply-templates select="department/course" /></li>
    	</ol>
</xsl:template>
	<xsl:template match="department/course">
		<br /> <br />The <strong>head of the course</strong> for department <strong><xsl:value-of select="parent::department/@name" /></strong> is <strong><xsl:value-of select="head" /></strong>
		<br />The subject is taught by <strong><xsl:value-of select="subject/professor" /></strong>
		<br /> Meeting time <strong><xsl:value-of select="subject/meeting_time"/></strong>
		<br />Meeting Place <strong><xsl:value-of select = "subject/meeting_room" /></strong>
		<br /> Advisor <strong><xsl:value-of select="advisor" /></strong>
	</xsl:template>
</xsl:stylesheet>
