<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.koubei-feeds">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-koubei-feeds" ox-mod="koubei-feeds">
        	<xsl:variable name="has-op" select="count(data/operations/i) &gt; 0"/>
            <ul>
            	<xsl:for-each select="data/koubei-feeds/i">
            		<xsl:variable name="viewcount">
            			<xsl:choose><xsl:when test="view_count &gt; 10000"><xsl:value-of select="format-number(view_count div 10000,'0.0' )"/>万</xsl:when><xsl:otherwise><xsl:value-of select="view_count"/></xsl:otherwise></xsl:choose>
            		</xsl:variable>
            		<li class="feed">
            			<img src="https://a.oxm1.cc/img/blank.png" style="background-image:url({img})" class="mainpic"/>
            			<div class="user">
        					<xsl:if test="$has-op"><b class="bt-op"></b></xsl:if>
            				<img src="{avatar}"/>
            				<xsl:value-of select="user"/>
            			</div>
            			<h3 class="title">
            				<xsl:value-of select="title"/>
            			</h3>
            			<div class="bottom">
            				<xsl:if test="tag !=''">
            					<em class="tag"><xsl:value-of select="tag"/></em>
            				</xsl:if>
            				<xsl:choose>
            					<xsl:when test="spot !=''">
            						<em class="spot"><xsl:value-of select="spot"/></em>
            					</xsl:when>
            					<xsl:otherwise>
            						<xsl:if test="view_count &gt; 0 ">
		            					<em class="view"><xsl:value-of select="$viewcount"/></em>
		            				</xsl:if>
            						<xsl:if test="fav_count &gt; 0 ">
		            					<em class="fav"><xsl:value-of select="fav_count"/></em>
		            				</xsl:if>
            					</xsl:otherwise>
            				</xsl:choose>
            			</div>
            		</li>
            	</xsl:for-each>
            </ul>
            <xsl:if test="$has-op">
            	<div class="operation-mask">
            		<ul class="operation J_operation">
            			<xsl:for-each select="data/operations/i">
            				<li>
            					<xsl:value-of select="title"/>
            				</li>
            			</xsl:for-each>
            		</ul>
            	</div>
            </xsl:if>
        </div>
    </xsl:template>
</xsl:stylesheet>
