using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library_System_Prototype.App_Code
{
    public class clsBook
    {

        //Global attributes
        public List<clsBook> books = new List<clsBook>();
        public String isbn;
        public String bookAuthor;
        public String bookTitle;
        public String bookPublisher;
        public Int32 bookPublishYear;
        public String bookLocation;
        public Int32 bookEditionNo;
        public String bookGenreCode;

        public clsBook()
        {
            //Empty constructor to enable single initialisation
        }

        //Overloaded constructor finds all books with the matching titles and authors
        public clsBook(String bookTitle, String bookAuthor)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@bookTitle", bookTitle);
            dbManager.AddParameter("@bookAuthor", bookAuthor);
            dbManager.Execute("sproc_tblBook_FindBooks");

            for(Int32 i = 0; i < dbManager.Count; ++i)
            {
                clsBook singleBook = new clsBook();

                singleBook.isbn = Convert.ToString(dbManager.DataTable.Rows[i]["isbn"]);
                singleBook.bookAuthor = Convert.ToString(dbManager.DataTable.Rows[i]["bk_author"]);
                singleBook.bookTitle = Convert.ToString(dbManager.DataTable.Rows[i]["bk_title"]);
                singleBook.bookPublisher = Convert.ToString(dbManager.DataTable.Rows[i]["bk_publisher"]);
                singleBook.bookPublishYear = Convert.ToInt32(dbManager.DataTable.Rows[i]["bk_pub_yr"]);
                singleBook.bookLocation = Convert.ToString(dbManager.DataTable.Rows[i]["bk_shelf_no"]);
                singleBook.bookEditionNo = Convert.ToInt32(dbManager.DataTable.Rows[i]["bk_edition_no"]);
                singleBook.bookGenreCode = Convert.ToString(dbManager.DataTable.Rows[i]["fk1_genre_code"]);

                books.Add(singleBook);
            }
        }

        //This function takes one parameter, book's ISBN, and returns the book with the entered ISBN if one exists.
        public void GetBook(string ISBN)
        {
            clsDataConnection db = new clsDataConnection();
            db.AddParameter("@ISBN", ISBN);
            db.Execute("sproc_FindBook");
            mISBN = ISBN;
            mTitle = Convert.ToString(db.DataTable.Rows[0]["bk_title"]);
            mAuthor = Convert.ToString(db.DataTable.Rows[0]["bk_author"]);
            mPublisher = Convert.ToString(db.DataTable.Rows[0]["bk_publisher"]);
            mPubYear = Convert.ToString(db.DataTable.Rows[0]["bk_pub_yr"]);
            mShelfNo = Convert.ToString(db.DataTable.Rows[0]["bk_shelf_no"]);
            mEdition = Convert.ToString(db.DataTable.Rows[0]["bk_edition_no"]);
        }

        //EditBook accepts all of book's properties and adds them as parameters, allowing for the details to be edited
        public void EditBook(string ISBN, string Title, string Author, string Publisher, Int32 PubYear, string ShelfNo, Int32 Edition, string Genre)
        {
            clsDataConnection db = new clsDataConnection();
            db.AddParameter("@ISBN", ISBN);
            db.AddParameter("@Author", Author);
            db.AddParameter("@Title", Title);
            db.AddParameter("@Publisher", Publisher);
            db.AddParameter("@PubYear", PubYear);
            db.AddParameter("@ShelfNo", ShelfNo);
            db.AddParameter("@Edition", Edition);
            db.AddParameter("@Genre", Genre);
            db.Execute("sproc_EditBook");
        }

        //Getters and setters for the class' properties
        private string mTitle;
        public string Title
        {
            get
            {
                return mTitle;
            }
            set
            {
                mTitle = value;
            }
        }
        private string mAuthor;
        public string Author
        {
            get
            {
                return mAuthor;
            }
            set
            {
                mAuthor = value;
            }
        }
        private string mISBN;
        public string ISBN
        {
            get
            {
                return mISBN;
            }
            set
            {
                mISBN = value;
            }
        }
        private string mPublisher;
        public string Publisher
        {
            get
            {
                return mPublisher;
            }
            set
            {
                mPublisher = value;
            }
        }

        private string mPubYear;
        public string PubYear
        {
            get
            {
                return mPubYear;
            }
            set
            {
                mPubYear = value;
            }
        }

        private string mShelfNo;
        public string ShelfNo
        {
            get
            {
                return mShelfNo;
            }
            set
            {
                mShelfNo = value;
            }
        }
        private string mEdition;
        public string Edition
        {
            get
            {
                return mEdition;
            }
            set
            {
                mEdition = value;
            }
        }

    }
}