
<table>
      <tr>
            <th>Jobseeker</th>
            <th>Status</th>
      </tr>
      <g:each in="${applicationProcessList}" var="application">
            <tr>
                  <td>${application.jobseeker.firstName}</td>
                  <td>${application.process.description}</td>
            </tr>
      </g:each>
</table>