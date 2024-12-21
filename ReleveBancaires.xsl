<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé de Compte Bancaire</title>
                <style>
                    body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                    line-height: 1.6;
                    }
                    h1, h2, h3 {
                    color: #2c3e50;
                    }
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 20px;
                    }
                    th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                    }
                    th {
                    background-color: #f4f4f4;
                    font-weight: bold;
                    }
                    p {
                    margin: 10px 0;
                    }
                </style>
            </head>
            <body>
                <h1>Relevé de Compte Bancaire</h1>
                
                <h2>Informations Générales</h2>
                <table>
                    <tbody>
                        <tr>
                            <th>Date du Relevé</th>
                            <th>RIB</th>
                            <th>Solde</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="/releve/dateReleve"/></td>
                            <td><xsl:value-of select="/releve/@RIB"/></td>
                            <td><xsl:value-of select="/releve/solde"/></td>
                        </tr>
                    </tbody>
                </table>
                
                <h2>Période des Opérations</h2>
                <p><strong>Date Début :</strong> <xsl:value-of select="releve/operations/@dateDebut" />&#160;&#160;&#160;<strong>Date Fin :</strong> <xsl:value-of select="releve/operations/@dateFin" /></p>
                
                <h2>Détail des Opérations</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Type d'Opération</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="releve/operations/operation">
                            <tr>    
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@description"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                
                <h2>Résumé des Totaux</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Total des Débits</th>
                            <th>Total des Crédits</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>    
                            <td><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/></td>
                            <td><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></td>
                        </tr>
                    </tbody>
                </table>
                
                <h2>Opérations de Crédit</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Type d'Opération</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                            <tr>    
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@description"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
