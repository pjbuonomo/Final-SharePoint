<xsl:stylesheet version="1.0"

              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

              xmlns:msxsl="urn:schemas-microsoft-com:xslt"

              exclude-result-prefixes="msxsl" xmlns:ddwrt2="urn:frontpage:internal">



  <xsl:output method='html' indent='yes'/>
  <xsl:template match='dsQueryResponse'>
<div  style="width:98%;padding-left:10px">

 <div id="page-wrapper">
      
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                       
					All Open Task
					
					
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        

                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover " id="Task-table">
                                    <thead>
                                    <tr>
                                    <td colspan="9" style="text-align:left">
                                    <input type="button" class="btn btn-primary" >
						<xsl:attribute name="value">
						Add New Task
						</xsl:attribute>
						<xsl:attribute name="onclick">
							AddTask()
						</xsl:attribute>
						</input>

                                    </td>
                                    </tr>
                                        <tr style="color: White;background-color: #00B3E3;font-weight: bold;">
                                            <th>ID</th>
                                            <th>Project Name</th>
                                            <th>Task Name</th>
                                            <th>Due Date</th>
                                            <th>Assigned To</th>
                                            <th>Comments</th>
                                             <th>% of Complete</th>
                                            

<th></th>
                                        </tr>
                                    </thead>
                                     <tbody>
                                          <xsl:apply-templates select='Rows/Row'/>
                                     
                                  </tbody>
                                   
                                </table>
                            </div>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            </div>
        
   


</div>

  <xsl:text disable-output-escaping="yes">
&lt;script&gt;

 function AddTask()
 {
            
            var options = {

                url: "../Lists/tasks/NewForm.aspx",
                title: "Add Task",
                dialogReturnValueCallback: function (dialogResult) {
		 if (dialogResult != SP.UI.DialogResult.cancel)
		        {
        	    SP.UI.ModalDialog.RefreshPage(dialogResult)
	        	}

                },
                allowMaximize: false
            };
            SP.SOD.execute('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', options);
                
        }
        
        function EditTask(Parameter)
 {
            
            var options = {

                url: "../Lists/tasks/EditForm.aspx?ID="+Parameter,
                title: "Add Task",
                dialogReturnValueCallback: function (dialogResult) {
		 if (dialogResult != SP.UI.DialogResult.cancel)
		        {
        	    SP.UI.ModalDialog.RefreshPage(dialogResult)
	        	}

                },
                allowMaximize: false
            };
            SP.SOD.execute('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', options);
                
        }
        $(document).ready(function () {
            $('#Task-table').DataTable({
                responsive: true,
                dom: 'Bfrtip',
        buttons: [{
                extend: 'copy',
                title: 'All Open Task',
                exportOptions: {
                   columns: '0,1,2,3,4,5,6:visible'
                   
                }},
                {
                extend: 'csv',
                title: 'All Open Task',
                exportOptions: {
                   columns: '0,1,2,3,4,5,6:visible'
                }},
                 {
                extend: 'excel',
                title: 'All Open Task',
                exportOptions: {
                   columns: '0,1,2,3,4,5,6:visible'
                }},
                 {
                extend: 'pdf',
                title: 'All Open Task',
                exportOptions: {
                   columns: '0,1,2,3,4,5,6:visible'
                }},
                   {
                extend: 'print',
                title: 'All Open Task',
                exportOptions: {
                   columns: '0,1,2,3,4,5,6:visible'
                }}




                
                
                ]

           
        
            });
        });
   

        &lt;/script&gt;


</xsl:text>
  </xsl:template>



  <xsl:template match='Row'>

    <tr>

      <td >
        <xsl:value-of select="@ID"></xsl:value-of>
      </td>   

      <td>
         <xsl:value-of select="@Project_x0020_Name" disable-output-escaping="yes"></xsl:value-of>
      </td>
	  <td>
         <xsl:value-of select="@Title"></xsl:value-of>
      </td> 
        <td>
         <xsl:value-of select="@DueDate"></xsl:value-of>
      </td>  
<td>
         <xsl:value-of select="@AssignedTo" disable-output-escaping="yes"></xsl:value-of>
      </td> 
      <td>
         <xsl:value-of select="@Body" disable-output-escaping="yes"></xsl:value-of>
      </td> 
       <td>
         <xsl:value-of select="@PercentComplete" disable-output-escaping="yes"></xsl:value-of>
      </td> 
       

      
<td>


<input type="button" class="btn btn-primary" >
						<xsl:attribute name="value">
						Edit
						</xsl:attribute>
						<xsl:attribute name="onclick">
							EditTask('<xsl:value-of select="@ID"></xsl:value-of>')
						</xsl:attribute>
						</input>

</td>


    </tr>

  </xsl:template>


</xsl:stylesheet>
