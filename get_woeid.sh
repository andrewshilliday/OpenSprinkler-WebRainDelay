#!/bin/bash

# The XSL to use to parse the output
read -d '' xsl <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="query">
        <xsl:for-each select="results/Result">
            <xsl:value-of select="woeid"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="*[starts-with(name(),'line')]/node()[1]"/>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
EOF

# The yql query
query="select line1,line2,line3,line4,woeid from geo.placefinder where text=\"$1\""

# the url for the yahoo API
url="http://query.yahooapis.com/v1/public/yql"

# Get the response
response=`curl -s --data-urlencode "q=$query" $url`

# Print out the relevent data (note that there may be more than one result)
xsltproc <(echo $xsl) <(echo $response)
