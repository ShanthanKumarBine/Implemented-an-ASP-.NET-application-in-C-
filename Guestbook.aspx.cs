// Code-behind file that defines event handlers for the guestbook.
using System;
using System.Collections.Specialized; // for class ListDictionary

public partial class Guestbook : System.Web.UI.Page
{
   // Submit Button adds a new guestbook entry to the database,
   // clears the form and displays the updated list of guestbook entries
   protected void submitButton_Click( object sender, EventArgs e )
   {

        //for Bachelors
        string selectedValue = "Bachelors";
        if (Radio1.Checked)
        {
            selectedValue = "Masters";
        }
        else if (Radio2.Checked)
        {
            selectedValue = "Bachelors";
        }
        string sqlValue = ToSql(selectedValue);

        //for Residency
        string selectedValue1 = "OutState";
        if (Radio3.Checked)
        {
            selectedValue1 = "InState";
        }
        else if (Radio4.Checked)
        {
            selectedValue1 = "OutState";
        }
        string ResidencyValue = ToSql(selectedValue1);

        // execute an INSERT  statement to add a new entry to the      
        // Messages table in the Guestbook Access Data Source

        GuestbookAccessDataSource.InsertCommand = 
            "INSERT INTO [StudentDetails] (" +

             "[StudentType]" + ", " +
            "[FirstName]" + ", " +
            "[LastName]" + ", " +
            "[Credits]" + ", " +
            "[residency]" + // Caution: no , after the last attribute

            ") VALUES (" +

            sqlValue + ", " +
            ToSql(FirstNameTextBox.Text) + ", " +
            ToSql(LastNameTextBox.Text) + ", " +
            ToSql(CreditsTextBox.Text) + ", " +
            ResidencyValue +

            ")";

        GuestbookAccessDataSource.Insert();

        // clear the TextBoxes
        clearTextBoxes();

      // update the GridView with the new database table contents
      messagesGridView.DataBind();
   } // submitButton_Click

    // format a string value for SQL
    private string ToSql(string stringValue)
    {
        return "'" + stringValue.Replace("'", "''") + "'";
    }

    // clear the TextBoxes
    private void clearTextBoxes()
    {
        FirstNameTextBox.Text = String.Empty;
        LastNameTextBox.Text = String.Empty;
        CreditsTextBox.Text = String.Empty;
    }

    // Clear Button clears the Web Form's TextBoxes
    protected void clearButton_Click( object sender, EventArgs e )
   {
        clearTextBoxes();
   } // clearButton_Click

    protected void AccessDataSource1_Selecting(object sender, System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs e)
    {

    }
} // end class Guestbook
