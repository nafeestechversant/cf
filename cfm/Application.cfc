<!-- Set the value of MyDatabase to be the name you published the database under -->
<cfcomponent output="false">
    <cfset this.name = 'My App' />
    <cfset this.applicationTimeout = createtimespan(0,2,0,0) />
    <cfset this.datasource = 'download' />
</cfcomponent>>
