using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentInGroup
/// </summary>
public class StudentInGroup
{
    private string _userId;
    private string _email;
    private Guid _id;

	public StudentInGroup(string userId, string email, Guid id)
	{
	    _userId = userId;
	    _email = email;
	    _id = id;
	}

    public string UserId
    {
        get { return _userId; }
    }

    public string Email
    {
        get { return _email; }
    }

    public Guid Id
    {
        get { return _id; }
    }
}