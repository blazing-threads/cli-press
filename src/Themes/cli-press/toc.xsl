<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
    <!--
        * This file is part of CLI Press.
        *
        * The MIT License (MIT)
        * Copyright © 2017
        *
        * Alex Carter, alex@blazeworx.com
        * Keith E. Freeman, cli-press@forsaken-threads.com
        *
        * For the full copyright and license information, please view the LICENSE
        * file that should have been distributed with this source code.
    -->
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                indent="yes"/>
    <xsl:template match="outline:outline">
        <html>
            <head>
                <title>Table of Contents</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <style>
                    body {
                        background: #ffffff;
                        color: #222222;
                        font-family: "Roboto Condensed", "Tauri", "Hiragino Sans GB", "Microsoft YaHei", "STHeiti", "SimSun", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", 'Segoe UI', AppleSDGothicNeo-Medium, 'Malgun Gothic', Verdana, Tahoma, sans-serif;
                        font-size: 15px;
                        line-height: 1.6 !important;
                        -webkit-font-smoothing: antialiased;
                    }

                    a {
                        color: black;
                        text-decoration: none;
                    }

                    div {
                        border-bottom: 1px dashed rgb(200,200,200);
                    }

                    ul div {
                        border-bottom: 1px solid rgb(200,200,200);
                        display:block;
                        padding-top:40px;
                    }

                    ul ul div {
                        border-bottom: 1px dashed rgb(200,200,200);
                        display: block;
                        padding-bottom:3px;
                        padding-top: 3px;
                    }

                    li {
                        list-style: none;
                        margin-bottom: 3px;
                        margin-top: 3px;
                    }

                    p.title {
                        font-size: 20px;
                        font-family: sans-serif;
                        margin-top:30px;
                        text-align: center;
                        -ms-text-size-adjust: 100%;
                        -webkit-text-size-adjust: 100%;
                    }

                    span {
                        float: right;
                    }

                    ul {
                        padding-left: 0em;
                    }

                    ul,
                    ul a {
                        color: #8ab4d8;
                        font-size: 20px;
                        font-family: arial;
                    }

                    ul ul {
                        padding-left: 1.3em;
                    }

                    ul ul,
                    ul ul a {
                        color: black;
                        font-size: 80%;
                    }
                </style>
            </head>
            <body>
                <p class="title">Table of Contents</p>
                <ul class="top">
                    <xsl:apply-templates select="outline:item/outline:item"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="outline:item">
        <li>
            <xsl:if test="@title!=''">
                <div>
                    <a>
                        <xsl:if test="@link">
                            <xsl:attribute name="href">
                                <xsl:value-of select="@link"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@backLink">
                            <xsl:attribute name="name">
                                <xsl:value-of select="@backLink"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="@title"/>
                    </a>
                    <span>
                        <a>
                            <xsl:if test="@link">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@link"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@backLink">
                                <xsl:attribute name="name">
                                    <xsl:value-of select="@backLink"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="@page"/>
                        </a>
                    </span>
                </div>
            </xsl:if>
            <ul>
                <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
                <xsl:apply-templates select="outline:item"/>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>