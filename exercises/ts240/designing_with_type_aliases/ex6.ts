interface Account {
  username: string,
  email: string,
  readonly accountDreationDate: string,
}

const accountExample: Account = {
  username: 'Chris',
  email: 'email@address',
  accountDreationDate: 'today',
}

accountExample.username = 'Chris Piemonte';
accountExample.accountDreationDate = 'tomorrow'; // can't change readonly properties
